$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "letter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "letter"
  s.version     = Letter::VERSION
  s.authors     = ["Victor Vitalino"]
  s.email       = ["vitalino.victor@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Letter."
  s.description = "Description of Letter."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
