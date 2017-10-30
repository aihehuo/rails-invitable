module RailsInvitable
  class WithdrawPolicy < ApplicationPolicy
    def create?
      user.red_pocket >= RailsInvitable.configuration.minimum_withdraw_amount
    end

    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
