require 'test_helper'

class ReferralCreatorTest < ActiveSupport::TestCase
  test "Code will auto genrated if not given" do
    referral = RailsInvitable::ReferralCreator.new(users(:david)).call

    assert_not_empty referral.code
  end
end
