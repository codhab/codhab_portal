$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "assistance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "assistance"
  s.version     = Assistance::VERSION
  s.authors     = ["Victor Vitalino"]
  s.email       = ["vitalino.victor@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Assistance."
  s.description = "Description of Assistance."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
