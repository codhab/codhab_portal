$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "regularization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "regularization"
  s.version     = Regularization::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "http://codhab.df.gov.br"
  s.summary     = "Engine de regularização no portal"
  s.description = "Engine gestora de agendamentos e requerimentos de regularização"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 5.0.2"
  
end
