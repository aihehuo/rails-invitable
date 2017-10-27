require 'test_helper'

module RailsInvitable
  class Api::V1::ReferralsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get api_v1_referrals_url
      assert_response :success
    end

  end
end
