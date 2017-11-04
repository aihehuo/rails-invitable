require 'pundit'
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
  puts "Please add the pingpp gem to your application's Gemfile. The rails_invitable engine needs pingpp for payment."
  exit
end

begin
  require 'kaminari'
rescue LoadError
  puts "Please add the kaminari gem to your application's Gemfile. The rails_invitable engine needs kaminari for pagination."
  exit
end
