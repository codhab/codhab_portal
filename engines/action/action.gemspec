$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "action"
  s.version     = Action::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of ActionPortal."
  s.description = "Description of Action."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"

end
