module RailsInvitable
  class Configuration
    attr_accessor :allowed_withdraw_channels

    def initialize
      @allowed_withdraw_channels = ['wx_pub', 'alipay']
    end
  end
end
