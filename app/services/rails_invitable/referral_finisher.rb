module RailsInvitable
  class ReferralFinisher
    def initialize(user)
      @user = user
    end

    def call
      return false unless referral && !referral.completed_at
      ActiveRecord::Base.transaction do
        complete_accepted_referral
        record_the_reward
        give_reward_to_user
      end
      referral
    rescue
      false
    end

    private

    attr_reader :user

    def complete_accepted_referral
      referral.update!(completed_at: Time.now)
    end

    def record_the_reward
      RedPocketRecord.create!(referable: referral, amount: reward_amount, incoming: true, user: user)
    end

    def give_reward_to_user
      user.increment!(:red_pocket, reward_amount)
    end

    def referral
      @referral ||= UserAcceptedReferral.find_by(user: user)
    end

    def reward_amount
      @reward_amount ||= RailsInvitable.configuration.referral_complete_red_pocket_reward
    end
  end
end
