RailsInvitable.configure do |config|
  config.allowed_withdraw_channels = ['wx_pay'] # default to ['wx_pub', 'alipay']
end

RailsInvitable.user_class = "User"
