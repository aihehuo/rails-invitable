module RailsInvitable
  class WithdrawCreator
    include ActiveModel::Validations

    validates :amount, numericality: { greater_than_or_equal_to: RailsInvitable.configuration.minimum_withdraw_amount }
    validates :channel, inclusion: { in: %w(wx_pub) }
    validate :user_has_enough_red_pocket_balance
    validate :user_has_wechat_openid

    def initialize(user, amount, channel = 'wx_pub')
      @user = user
      @amount = amount
      @channel = channel
    end

    def call
      if valid?
        if withdraw and withdraw.transfer["status"] == "failed"
          case withdraw.transfer["failure_msg"]
          when /该用户今日付款次数超过限制/
            err_msg = "每天只能提现一次"
          else
            err_msg = '提现失败，请联系客服'
          end
          return err_msg
        else
          return withdraw
        end
      else
        return false
      end
    end

    private

    attr_reader :user, :amount, :channel

    def transfer
      @transfer ||= Pingpp::Transfer.create(
  			 :order_no    => order_no,
    		 :app         => { :id => RailsInvitable.configuration.pingpp_app_id },
    		 :channel     => channel,
    		 :amount      => amount * 100,
    		 :currency    => 'cny',
    		 :type        => "b2c",
    		 :recipient   => user.openid,
    		 :description => I18n.t('rails_invitable.payments.withdraw_description', name: user.name, amount: amount)
  		)
    end

    def withdraw
      @withdraw ||= Withdraw.create!(
        amount: amount,
        user: user,
        transfer: transfer,
        channel: channel,
        order_no: order_no
      )
    end

    def order_no
      @order_no ||= RailsInvitable.configuration.order_prefix + 'T' + Time.now.to_i.to_s + 'R' + rand(1000..9999).to_s
    end

    def user_has_enough_red_pocket_balance
      unless user.red_pocket >= amount
        errors.add(:amount, I18n.t('rails_invitable.payments.not_enought_red_pocket'))
      end
    end

    def user_has_wechat_openid
      unless user.respond_to?(:openid) && user.openid != nil
        errors.add(:openid, I18n.t('rails_invitable.payments.openid_is_missing'))
      end
    end
  end
end
