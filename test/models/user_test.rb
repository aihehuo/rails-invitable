require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Red_pocket default is 0" do
    assert_equal 0, users(:david).red_pocket
  end
end
