require 'test_helper'

module RailsInvitable
  class Api::V1::WithdrawsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(users(:david))
      Pingpp::Transfer.expects(:create).with(Not(equals(nil))).at_least(0).returns({mocha: true})
    end

    test "create is success" do
      post api_v1_withdraws_url, params: { amount: 10 }
      assert_response :success
    end

    test "fail if amount is too small" do
      post api_v1_withdraws_url, params: { amount: 1 }
      assert_response 422
    end

    test "fail if amount is too big" do
      post api_v1_withdraws_url, params: { amount: 1001 }
      assert_response 422
    end
  end
end
