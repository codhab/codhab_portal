$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "address/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "address"
  s.version     = Address::VERSION
  s.authors     = ["igormarjes"]
  s.email       = ["igormarjes@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Address."
  s.description = " Description of Address."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.2"
end
