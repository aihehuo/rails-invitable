require 'test_helper'

module RailsInvitable
  class Api::V1::UserAcceptedReferralsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(users(:david))
    end

    test "should get index" do
      get api_v1_user_accepted_referrals_url
      assert_response :success
    end

    test "current_user stub is working" do
      assert users(:david), ApplicationController.new.current_user
    end

  end
end
