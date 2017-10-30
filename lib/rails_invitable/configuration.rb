module RailsInvitable
  class Configuration
    attr_accessor :allowed_withdraw_channels,
                  :minimum_withdraw_amount,
                  :order_prefix,
                  :pingpp_app_id

    def initialize
      @allowed_withdraw_channels = ['wx_pub', 'alipay']
      @minimum_withdraw_amount = 10
      @order_prefix = 'HEPBURNORDER'
    end
  end
end
