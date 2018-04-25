$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "person/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "person"
  s.version     = Person::VERSION
  s.authors     = ["Igor Marques"]
  s.email       = ["igormarjes@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Person."
  s.description = "Description of Person."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
