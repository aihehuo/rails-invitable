require 'test_helper'

module RailsInvitable
  class Api::V1::RedPocketRecordsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(users(:david))
    end

    test "should return index" do
      get api_v1_red_pocket_records_url

      assert_response :success
    end
  end
end
