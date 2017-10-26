require 'test_helper'

module RailsInvitable
  class ReferralTest < ActiveSupport::TestCase
    test "belongs to user" do
      assert rails_invitable_referrals(:from_david).user
    end

    test "referral code is necessary" do
      referral = RailsInvitable::Referral.create(user: users(:david))

      assert_not referral.valid?
    end

    test "referral code can not be the same" do
      code = '1234567890'
      RailsInvitable::Referral.create(code: code, user: users(:david))
      referral = RailsInvitable::Referral.create(code: code, user: users(:david))

      assert_not referral.valid?
    end
  end
end
