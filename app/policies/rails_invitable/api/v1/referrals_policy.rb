module RailsInvitable
  class Api::V1::ReferralsPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
