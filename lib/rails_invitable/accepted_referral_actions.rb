# Helper hooks and methods
module RailsInvitable
  module AcceptedReferralActions
    def complete_accepted_referral(user)
      ReferralFinisher.new(user).call
    end

    def referral_register(phone, user)
      ReferralRegister.new(phone, user).call
    end
  end
end
