$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "document/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "document"
  s.version     = Document::VERSION
  s.authors     = ["canamari"]
  s.email       = ["cleubercanamari11@gmail.com"]
  s.authors     = ["Igor"]
  s.email       = ["igormarjes@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Document."
  s.description = "Description of Document."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
