require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::ReferralsController < ApplicationController
    def show
      @referral = Referral.find(params[:id])
      authorize @referral
      render jsonapi: @referral
    end

  end
end
