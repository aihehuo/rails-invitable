$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_invitable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_invitable"
  s.version     = RailsInvitable::VERSION
  s.authors     = ["Bran Liang"]
  s.email       = ["lby89757@hotmail.com"]
  s.homepage    = "http://www.liangboyuan.pub"
  s.summary     = "Plugable invitation system for rails."
  s.description = "Module invitation design."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5"
  s.add_dependency "pundit", "~> 1.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mocha"
end
