class RailsInvitable::InstallGenerator < Rails::Generators::Base
  class_option :user_class, type: :string
  class_option :no_migrate, :type => :boolean
  class_option :current_user_helper, :type => :string

  source_root File.expand_path('../templates', __FILE__)
  desc "Used to install RailsInvitable"

  def install_migrations
    unless options[:no_migrate]
      puts "Copying over migrations..."
      Dir.chdir(Rails.root) do
        `bundle exec rails rails_invitable:install:migrations`
      end
    end
  end

  def determine_user_class
    @user_class = options[:user_class].presence ||
                  ask("What is your user class called? [User]").presence ||
                  'User'
  end

  def determine_current_user_helper
    current_user_helper = options[:current_user_helper].presence ||
                          ask("What is the current_user helper called in your app? [current_user]").presence ||
                          :current_user

    puts "Defining rails_invitable_user method inside ApplicationController..."

    rails_invitable_user_method = %Q{
      def rails_invitable_user
        #{current_user_helper}
      end
      helper_method :rails_invitable_user
    }

    inject_into_file("#{Rails.root}/app/controllers/application_controller.rb",
                     rails_invitable_user_method,
                     :after => "ActionController::Base\n")

  end

  def add_initializer
    path = "#{Rails.root}/config/initializers/rails_invitable.rb"
    if File.exists?(path)
      puts "Skipping config/initializers/rails_invitable.rb creation, as file already exists!"
    else
      puts "Adding rails_invitable initializer (config/initializers/rails_invitable.rb)..."
      template "rails_invitable.rb", path
      require path
    end
  end

  def run_migrations
    unless options[:no_migrate]
      puts "Running rake db:migrate"
      `rake db:migrate`
    end
  end

  # def mount_engine
  #   puts "Mounting RailsInvitable::Engine at \"/rails_invitable\" in config/routes.rb..."
  #   insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
  #     %Q{
  #       # This line mounts rails invitable's routes at /rails_invitable by default.
  #       mount RailsInvitable::Engine, :at => '/rails_invitable'
  #     }
  #   end
  # end

  def finish
    output = "\n\n" + ("*" * 53)
    output += %Q{\nDone! RailsInvitable has been successfully installed. Yaaaaay!\n\n}
    puts output
  end

  def user_class
    @user_class
  end

end
