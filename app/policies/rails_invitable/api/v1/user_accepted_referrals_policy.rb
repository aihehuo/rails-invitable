module RailsInvitable
  class Api::V1::UserAcceptedReferralsPolicy < ApplicationPolicy

    def create?
    end

    class Scope < Scope
      def resolve
        scope.joins(:referral).where("rails_invitable_referrals.user_id = ?", user.id)
      end
    end
  end
end
