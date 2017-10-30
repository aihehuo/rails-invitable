module RailsInvitable
  class Configuration
    attr_accessor :allowed_withdraw_channels,
                  :minimum_withdraw_amount

    def initialize
      @allowed_withdraw_channels = ['wx_pub', 'alipay']
      @minimum_withdraw_amount = 10
    end
  end
end
