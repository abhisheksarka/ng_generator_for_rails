$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ng_generator_for_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ng_generator_for_rails"
  s.version     = NgGeneratorForRails::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of NgGeneratorForRails."
  s.description = "TODO: Description of NgGeneratorForRails."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.9"
end
