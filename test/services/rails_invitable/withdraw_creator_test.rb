require 'test_helper'

class WithdrawCreatorTest < ActiveSupport::TestCase

  setup do
    @pingpp_response = {
      "id": "tr_HqbzHCvLOaL4La1ezHfDWTqH",
      "object": "transfer",
      "type": "b2c",
      "created": 1432724825,
      "time_transferred": nil,
      "livemode": true,
      "status": "pending",
      "app": "app_1Gqj58ynP0mHeX1q",
      "channel": "wx_pub",
      "order_no": "123456789",
      "amount": 100,
      "amount_settle": 100,
      "currency": "cny",
      "recipient": "o7zpMs5MW2-52GAy5hRrjdYVCktU",
      "description": "Your Description",
      "transaction_no": "1000018301201505200184147302",
      "failure_msg": nil,
      "extra": {
          "user_name": "User Name",
          "force_check": true
         }
    }
    Pingpp::Transfer.expects(:create).with(Not(equals(nil))).at_least(0).returns(@pingpp_response)
  end

  test "call is success" do
    withdraw = RailsInvitable::WithdrawCreator.new(users(:david), 10).call

    assert withdraw
    assert_equal 10, withdraw.amount
  end

  test "amount can not be greater than user balance" do
    withdraw = RailsInvitable::WithdrawCreator.new(users(:david), 1001).call

    assert_equal false, withdraw
  end
end
