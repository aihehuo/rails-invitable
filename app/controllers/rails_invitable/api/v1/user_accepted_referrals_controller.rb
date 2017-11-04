require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::UserAcceptedReferralsController < ApplicationController
    def index
      @user_accepted_referrals = policy_scope(UserAcceptedReferral)

      render_pagination(@user_accepted_referrals, [:user])
    end

    # @@params [:phone, :ref_code]
    def create
      skip_authorization
      @referral = find_referral(params[:ref_code])
      user_accepted_referral = UserAcceptedReferral.new(phone: params[:phone], referral: @referral)
      if user_accepted_referral.save
        render json: user_accepted_referral, root: :data
      else
        head 422
      end
    end

    private

    def find_referral(code)
      referral = Referral.find_by(code: code)
      head 404 unless referral
      referral
    end
  end
end
