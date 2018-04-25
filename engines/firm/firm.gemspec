$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "firm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "firm"
  s.version     = Firm::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Firm."
  s.description = "Description of Firm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"

end
