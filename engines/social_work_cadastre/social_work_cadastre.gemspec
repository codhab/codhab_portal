$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social_work_cadastre/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social_work_cadastre"
  s.version     = SocialWorkCadastre::VERSION
  s.authors     = ["canamari"]
  s.email       = ["cleubercanamari11@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of SocialWorkCadastre."
  s.description = "Description of SocialWorkCadastre."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
