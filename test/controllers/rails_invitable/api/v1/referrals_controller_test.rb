require 'test_helper'

module RailsInvitable
  class Api::V1::ReferralsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(users(:david))
    end

    test "#SHOW should show david's referral" do
      get api_v1_referral_url(rails_invitable_referrals(:from_david).id)

      assert_response :success
    end

    test "#SHOW normal user can only see their self referral code" do
      get api_v1_referral_url(rails_invitable_referrals(:from_bran).id)

      assert_response :unauthorized
    end

  end
end
