require 'test_helper'

module RailsInvitable
  class RedPocketRecordTest < ActiveSupport::TestCase
    test "belongs_to user" do
      assert rails_invitable_red_pocket_records(:from_david).user
    end

    test "belongs_to referable" do
      assert rails_invitable_red_pocket_records(:from_david).referable
    end
  end
end
