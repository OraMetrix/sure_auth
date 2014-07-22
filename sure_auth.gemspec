lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

# Maintain your gem's version:
require "sure_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sure_auth"
  s.version     = SureAuth::VERSION
  s.authors     = ["idgetto"]
  s.email       = ["isaac.getto@orametrix.com"]
  s.homepage    = ""
  s.summary     = "Service oriented authentication gem"
  s.description = "This gem configures an oauth2 client"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "omniauth-oauth2"

  s.add_development_dependency "sqlite3"
end
