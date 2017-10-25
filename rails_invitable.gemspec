$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_invitable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_invitable"
  s.version     = RailsInvitable::VERSION
  s.authors     = ["Bran Liang"]
  s.email       = ["lby89757@hotmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsInvitable."
  s.description = "TODO: Description of RailsInvitable."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
