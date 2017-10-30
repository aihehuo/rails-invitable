module RailsInvitable
  class WithdrawsCreator
    def initialize(user, amount, channel)
      @user = user
      @amount = amount
      @channel = channel
    end

    def call
      Withdraw.transaction do
        create_withdraw
        record
      end
    end

    private

    attr_reader :user, :amount, :channel

    def transfer
      @transfer ||= Pingpp::Transfer.create(
  			 :order_no    => order_no,
    		 :app         => { :id => Rails.application.secrets.pingpp_app_id },
    		 :channel     => channel,
    		 :amount      => amount * 100,
    		 :currency    => 'cny',
    		 :type        => "b2c",
    		 :recipient   => user.openid,
    		 :description => I18n.t('rails_invitable.payments.withdraw_description', name: user.name, amount: amount)
  		)
    end

    def create_withdraw
    end

    def record
    end

    def order_no
    end
  end
end
