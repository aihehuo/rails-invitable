require 'test_helper'

module RailsInvitable
  class Api::V1::UserAcceptedReferralsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(users(:david))
    end

    test "should return index" do
      get api_v1_user_accepted_referrals_url

      assert_response :success
    end

    test "create" do
      post api_v1_user_accepted_referrals_url,
           params: {ref_code: rails_invitable_referrals(:from_bran).code, phone: '13584019999'}

      assert_response :success
    end

  end
end
