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
      config.order_prefix = 'HI'
    end

    assert_equal 'HI', RailsInvitable.configuration.order_prefix
  end
end
