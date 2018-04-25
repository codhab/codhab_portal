$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mobilization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mobilization"
  s.version     = Mobilization::VERSION
  s.authors     = ["Victor Vitalino"]
  s.email       = ["vitalino.victor@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Mobilization."
  s.description = "Description of Mobilization."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency "rails", "~> 5.0.2"

end
