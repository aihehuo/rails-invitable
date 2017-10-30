require 'test_helper'

module RailsInvitable
  class RedPocketRecordTest < ActiveSupport::TestCase
    test "belongs_to user" do
      assert rails_invitable_red_pocket_records(:from_david).user
    end

    test "belongs_to referable" do
      assert rails_invitable_red_pocket_records(:from_david).referable
    end

    test "referable is uniq" do
      implemented_referable = RailsInvitable::RedPocketRecord.first.referable
      record = RailsInvitable::RedPocketRecord.create(user: users(:yuan), amount: 10, referable: implemented_referable)

      assert_not record.valid?
    end
  end
end
