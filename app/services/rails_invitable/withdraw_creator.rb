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
        Withdraw.transaction do
          record(withdraw)
          charge_user_red_pocket
        end
        withdraw
      else
        false
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

    def record(withdraw)
      RedPocketRecord.create!(
        referable: withdraw,
        amount: amount,
        incoming: false,
        user: user
      )
    end

    def order_no
      @order_no ||= RailsInvitable.configuration.order_prefix + 'T' + Time.now.to_i.to_s + 'R' + rand(1000..9999).to_s
    end

    def charge_user_red_pocket
      user.increment!(:red_pocket, -amount)
    end

    def user_has_enough_red_pocket_balance
      unless user.red_pocket >= amount
        errors.add(:amount, I18n.t('rails_invitable.payments.not_enought_red_pocket'))
      end
    end

    def user_has_wechat_openid
      user.respond_to?(:openid) && user.openid != nil
    end
  end
end
