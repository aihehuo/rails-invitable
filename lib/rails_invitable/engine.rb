require 'pundit'
require 'kaminari'
require 'active_model_serializers'

module RailsInvitable
  class Engine < ::Rails::Engine
    isolate_namespace RailsInvitable
    config.generators.api_only = true
  end
end

# Pingpp is needed for the payment implementation.
begin
  require 'pingpp'
rescue LoadError
  puts "Please add the pingpp gem to your application's Gemfile. The rails_invitable engine pingpp for payment."
  exit
end
