class RailsInvitable::InstallGenerator < Rails::Generators::Base
  class_option :user_class, type: :string
  class_option :no_migrate, :type => :boolean

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

  def mount_engine
    if File.open("#{Rails.root}/config/routes.rb").read().match(/mount RailsInvitable::Engine/)
      puts "Skip auto mounting. RailsInvitable::Engine already mounted."
    else
      puts "Mounting RailsInvitable::Engine at \"/rails_invitable\" in config/routes.rb..."
      insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
        %Q{
          # This line mounts rails invitable's routes at /rails_invitable by default.
          mount RailsInvitable::Engine, :at => '/rails_invitable'
        }
      end
    end
  end

  def finish
    output = "\n\n" + ("*" * 53)
    output += %Q{\nDone! RailsInvitable has been successfully installed. Yaaaaay!\n\n}
    puts output
  end

  def user_class
    @user_class
  end

end
