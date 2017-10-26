require 'test_helper'

class RailsInvitable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RailsInvitable
  end

  test 'User model is linked from the host application' do
    assert_kind_of Class, RailsInvitable.user_class
  end

  test 'Configuration is working' do
    RailsInvitable.configure do |config|
      config.allowed_withdraw_channels = ['test']
    end

    assert_equal ['test'], RailsInvitable.configuration.allowed_withdraw_channels
  end
end
