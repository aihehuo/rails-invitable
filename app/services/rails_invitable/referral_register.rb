module RailsInvitable
  class ReferralRegister
    def initialize(phone, user)
      @phone = phone
      @user = user
    end

    def call
      return false unless referral && !referral.registered_at
      return false unless user_has_no_accepted_referral
      user_accepted_referral_registered
    end

    private

    attr_reader :phone, :user

    def user_accepted_referral_registered
      referral.update(registered_at: Time.now, user: user)
      referral
    end

    def referral
      @referral ||= UserAcceptedReferral.find_by(phone: phone)
    end

    def user_has_no_accepted_referral
      UserAcceptedReferral.where(user: user).length == 0
    end
  end
end
