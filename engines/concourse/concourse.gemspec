$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "concourse/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "concourse"
  s.version     = Concourse::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Concourse."
  s.description = "Description of Concourse."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
