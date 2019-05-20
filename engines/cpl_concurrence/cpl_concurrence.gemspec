$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cpl_concurrence/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cpl_concurrence"
  s.version     = CplConcurrence::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/codhab/codhab_portal.git"
  s.summary     = "Summary of CplConcurrence."
  s.description = "Description of CplConcurrence."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
