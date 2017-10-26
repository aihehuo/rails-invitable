class RailsInvitable::InstallGenerator < Rails::Generators::Base
  class_option :user_class, type: :string

  source_root File.expand_path('../templates', __FILE__)

  def add_files
    template 'rails_invitable.rb', 'config/initializers/rails_invitable.rb'
  end
end
