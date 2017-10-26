require 'test_helper'
require 'generators/rails_invitable/install/install_generator'

module RailsInvitable
  class RailsInvitable::InstallGeneratorTest < Rails::Generators::TestCase
    tests RailsInvitable::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test "generator runs create an initializer file" do
      run_generator ['--user_class=User', '--no-migrate=true', '--current_user_helper=current_user']

      assert_file "#{Rails.root}/config/initializers/rails_invitable.rb", /User/
    end

  end
end
