$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cpl_competition/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cpl_competition"
  s.version     = CplCompetition::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/codhab/codhab_portal"
  s.summary     = "Summary of CplCompetition."
  s.description = "Description of CplCompetition."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
