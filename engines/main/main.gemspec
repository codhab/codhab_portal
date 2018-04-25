$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "main/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "main"
  s.version     = Main::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/codhab/portal.git"
  s.summary     = "Summary of Main."
  s.description = "Description of Main."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
