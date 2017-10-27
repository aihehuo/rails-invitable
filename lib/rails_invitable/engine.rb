require 'pundit'
require 'kaminari'
require 'active_model_serializers'

module RailsInvitable
  class Engine < ::Rails::Engine
    isolate_namespace RailsInvitable
    config.generators.api_only = true
  end
end
