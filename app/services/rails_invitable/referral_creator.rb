require 'securerandom'

module RailsInvitable
  class ReferralCreator
    def initialize(user, code = nil)
      @user = user
      @code = code || auth_generate_code
    end

    def call
      create_referral
    end

    private

    attr_reader :user, :code

    def create_referral
      Referral.create(user: user, code: code)
    end

    def auth_generate_code
      SecureRandom.hex
    end
  end
end
