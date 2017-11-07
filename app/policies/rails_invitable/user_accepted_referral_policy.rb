module RailsInvitable
  class UserAcceptedReferralPolicy < ApplicationPolicy
    def create?
      true
    end

    class Scope < Scope
      def resolve
        if user.admin?
          scope
            .joins(:referral)
            .where("rails_invitable_user_accepted_referrals.user_id IS NOT NULL AND rails_invitable_user_accepted_referrals.registered_at IS NOT NULL")
            .where("rails_invitable_referrals.user_id = ?", user.id)
        else
          scope
            .joins(:referral)
            .where("rails_invitable_user_accepted_referrals.user_id IS NOT NULL AND rails_invitable_user_accepted_referrals.registered_at IS NOT NULL")
            .where("rails_invitable_referrals.user_id = ?", user.id)
        end
      end
    end
  end
end
