require 'test_helper'

class ReferralRegisterTest < ActiveSupport::TestCase
  setup do
    @phone = 13382019999
  end

  test "user and time is saved to the referral" do
    referral = RailsInvitable::ReferralRegister.new(@phone, users(:batman)).call

    assert_equal users(:batman), referral.user
    assert referral.registered_at
  end

  test "user already has accepted referral can not have another one" do
    referral = RailsInvitable::ReferralRegister.new(@phone, users(:david)).call

    assert_equal false, referral
  end
end
