$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "site_framework/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bodev-sites"
  s.version     = SiteFramework::VERSION
  s.authors     = ["Buildout, Inc"]
  s.email       = ["opensource@buildout.dev"]
  s.homepage    = "https://github.com/buildoutinc/bodev-sites"
  s.summary     = "A framework for Ruby on Rails inspired by Django's \"site\" fremework"
  s.description = "The idea of this gem to transparently make Rails understand the concept of working with different domains."
  s.licenses = ["GPL-2.0"]

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "railties", ">= 6.0"
  s.add_dependency "orm_adapter", "~> 0.5.0"

  s.add_development_dependency "rspec", "~> 3.7"
  s.add_development_dependency "rake", "~> 12.3"
end
