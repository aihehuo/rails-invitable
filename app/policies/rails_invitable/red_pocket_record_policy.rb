module RailsInvitable
  class RedPocketRecordPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.where(user: user)
        else
          scope.where(user: user)
        end
      end
    end
  end
end
