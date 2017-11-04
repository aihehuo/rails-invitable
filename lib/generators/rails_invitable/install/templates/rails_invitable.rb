RailsInvitable.configure do |config|
  # config.minimum_withdraw_amount = 10
  # config.order_prefix = 'HEPBURNORDER'
  # config.referral_complete_red_pocket_reward = 5 # 单位元
  # config.pingpp_app_id = YOUR_PINGPP_ID
end

RailsInvitable.user_class = "<%= user_class %>"

# Modify the user class
# RailsInvitable.user_class.class_eval do
#
# end
