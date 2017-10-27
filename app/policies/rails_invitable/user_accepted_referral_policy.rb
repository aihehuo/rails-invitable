module RailsInvitable
  class UserAcceptedReferralPolicy < ApplicationPolicy
    def create?
      true
    end

    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.joins(:referral).where("rails_invitable_referrals.user_id = ?", user.id)
        end
      end
    end
  end
end
