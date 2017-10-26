RailsInvitable.configure do |config|
  config.allowed_withdraw_channels = ['wx_pay'] # default to ['wx_pub', 'alipay']
end

RailsInvitable.user_class = <%= (options[:user_class].blank? ? "User" : options[:user_class]).inspect %>
