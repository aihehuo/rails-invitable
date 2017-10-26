require 'test_helper'

class RailsInvitable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RailsInvitable
  end

  test 'User model is linked from the host application' do
    assert_kind_of Class, RailsInvitable.user_class
  end
end
