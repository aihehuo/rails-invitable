module RailsInvitable
  class Api::V1::UserAcceptedReferralsPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
