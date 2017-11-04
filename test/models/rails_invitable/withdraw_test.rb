require 'test_helper'

module RailsInvitable
  class WithdrawTest < ActiveSupport::TestCase
    test "belongs_to user" do
      assert rails_invitable_withdraws(:from_david).user
    end
  end
end
