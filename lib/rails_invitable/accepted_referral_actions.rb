# For model user, add helper hooks and methods
module RailsInvitable
  module AcceptedReferralActions
    extend ActiveSupport::Concern

    included do
      after_create :referral_register
    end

    def referral_register
      ReferralRegister.new(self.phone, self).call
    end

    def complete_accepted_referral
      ReferralFinisher.new(self).call
    end
  end
end
