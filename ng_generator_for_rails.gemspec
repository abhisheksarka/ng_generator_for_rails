$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ng_generator_for_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ng_generator_for_rails"
  s.version     = NgGeneratorForRails::VERSION
  s.authors     = ["Abhishek Sarkar"]
  s.email       = ["abhisheksarka@gmail.com"]
  s.homepage    = "https://github.com/abhisheksarka/ng_generator_for_rails"
  s.summary     = ""
  s.description = "A simple angular components generator for an app using a 3 layered front end angular architecture."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
end
