require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::ReferralsController < ApplicationController
    def show
      @referral = Referral.find(params[:id])
      authorize @referral
      render json: @referral, include: [:user], root: :data
    end

  end
end
