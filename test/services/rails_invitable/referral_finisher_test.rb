require 'test_helper'

class ReferralFinisherTest < ActiveSupport::TestCase
  setup do
    @accepted_referral = RailsInvitable::ReferralFinisher.new(users(:other)).call
  end

  test "referral completed_at time is recorded" do
    assert @accepted_referral.completed_at
  end

  test "red_pocket reward is rewarded" do
    user_other_red_pocket_records = RailsInvitable::RedPocketRecord.where(user: users(:other))
    assert_equal 1, user_other_red_pocket_records.length
  end

  test "user red_pocket increased" do
    expected = RailsInvitable.configuration.referral_complete_red_pocket_reward
    assert_equal expected, users(:bran).red_pocket
  end
end
