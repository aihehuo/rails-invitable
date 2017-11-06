require 'test_helper'

class WithdrawCreatorTest < ActiveSupport::TestCase
  test 'Withdraw is finished' do
    withdraw = RailsInvitable::WithdrawSuccessor.new('ORDER1', {"foo": "bar"}).call
    assert_equal true, withdraw.success
  end

  test 'User red_pocket is charged' do
    withdraw = RailsInvitable::WithdrawSuccessor.new('ORDER1', {"foo": "bar"}).call
    assert_equal 990, withdraw.user.red_pocket
  end
end
