require 'test_helper'
require 'generators/rails_invitable/install/install_generator'

module RailsInvitable
  class RailsInvitable::InstallGeneratorTest < Rails::Generators::TestCase
    tests RailsInvitable::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test "generator runs create an initializer file" do
      run_generator

      assert_file 'config/initializers/rails_invitable.rb', /User/
    end

    test 'user class can be configrated with option user_class' do
      run_generator ['--user_class=MyUser']

      assert_file 'config/initializers/rails_invitable.rb', /MyUser/
    end
  end
end
