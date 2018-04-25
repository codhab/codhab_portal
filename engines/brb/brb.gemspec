$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brb"
  s.version     = Brb::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of Brb."
  s.description = ": Description of Brb."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
