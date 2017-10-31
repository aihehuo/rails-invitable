module RailsInvitable
  class Configuration
    attr_accessor :allowed_withdraw_channels,
                  :minimum_withdraw_amount,
                  :order_prefix,
                  :pingpp_app_id,
                  :referral_complete_red_pocket_reward

    def initialize
      @allowed_withdraw_channels = ['wx_pub', 'alipay']
      @minimum_withdraw_amount = 10
      @order_prefix = 'HEPBURNORDER'
      @referral_complete_red_pocket_reward = 5
    end
  end
end
