require 'test_helper'

module RailsInvitable
  class Api::V1::UserAcceptedReferralsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get api_v1_user_accepted_referrals_url
      assert_response :success
    end

  end
end
