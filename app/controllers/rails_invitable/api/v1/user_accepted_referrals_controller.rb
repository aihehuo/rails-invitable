require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::UserAcceptedReferralsController < ApplicationController
    def index
      referrals = policy_scope(UserAcceptedReferral)
      render json: referrals.to_json
    end

    def create
    end
  end
end
