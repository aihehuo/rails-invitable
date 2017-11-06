module RailsInvitable
  class Configuration
    attr_accessor :minimum_withdraw_amount,
                  :order_prefix,
                  :pingpp_app_id,
                  :referral_complete_red_pocket_reward,
                  :webhook_ip_whitelist

    def initialize
      @minimum_withdraw_amount = 10
      @order_prefix = 'HEPBURNORDER'
      @referral_complete_red_pocket_reward = 5
      @webhook_ip_whitelist = []
    end
  end
end
