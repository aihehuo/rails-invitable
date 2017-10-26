require 'test_helper'

module RailsInvitable
  class UserAcceptedReferralTest < ActiveSupport::TestCase
    setup do
      @phone = '13587878789'
    end

    test "belongs_to referral" do
      assert rails_invitable_user_accepted_referrals(:from_yuan_created).referral
    end

    test "belongs_to user" do
      assert rails_invitable_user_accepted_referrals(:from_yuan_created).user
    end

    test "user is optional" do
      user_accepted_referral = RailsInvitable::UserAcceptedReferral.create(referral: rails_invitable_referrals(:from_david), phone: @phone)

      assert user_accepted_referral.valid?
    end

    test "referral is mandatory" do
      user_accepted_referral = RailsInvitable::UserAcceptedReferral.create(user: users(:david), phone: @phone)

      assert_not user_accepted_referral.valid?
    end

    test "phone is mandatory" do
      user_accepted_referral = RailsInvitable::UserAcceptedReferral.create(user: users(:david), referral: rails_invitable_referrals(:from_david))

      assert_not user_accepted_referral.valid?
    end

    test "phone should be uniq" do
      RailsInvitable::UserAcceptedReferral.create(referral: rails_invitable_referrals(:from_david), phone: @phone)
      user_accepted_referral = RailsInvitable::UserAcceptedReferral.create(referral: rails_invitable_referrals(:from_bran), phone: @phone)

      assert_not user_accepted_referral.valid?
    end
  end
end
