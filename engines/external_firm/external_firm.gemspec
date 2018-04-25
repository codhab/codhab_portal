$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "external_firm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "external_firm"
  s.version     = ExternalFirm::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of ExternalFirm."
  s.description = "Description of ExternalFirm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
