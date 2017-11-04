module RailsInvitable
  class ReferralPolicy < ApplicationPolicy
    def show?
      user.admin? || user.id == record.user_id
    end

    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
