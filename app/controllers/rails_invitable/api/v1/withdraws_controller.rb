require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::WithdrawsController < ApplicationController
    def create
      authorize
      withdraw = WithdrawsCreator.new(current_user, amount, channel).call
      if withdraw
        render json: { data: withdraw.transfer, channel: withdraw.channel }.to_json, status: :created
      else
        head 422
      end
    end
  end
end
