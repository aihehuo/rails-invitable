require 'pundit'
require 'jsonapi/rails'
require 'kaminari'

module RailsInvitable
  class Engine < ::Rails::Engine
    isolate_namespace RailsInvitable
    config.generators.api_only = true
  end
end
