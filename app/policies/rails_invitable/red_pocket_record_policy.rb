module RailsInvitable
  class RedPocketRecordPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(user: user)
        end
      end
    end
  end
end
