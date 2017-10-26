require 'test_helper'

module RailsInvitable
  class UserTest < ActiveSupport::TestCase
    test 'User model is linked from the host application' do
      assert_kind_of Class, RailsInvitable.user_class
    end
  end
end
