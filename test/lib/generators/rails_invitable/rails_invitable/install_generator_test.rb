require 'test_helper'
require 'generators/rails_invitable/install/install_generator'

module RailsInvitable
  class RailsInvitable::InstallGeneratorTest < Rails::Generators::TestCase
    tests RailsInvitable::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
