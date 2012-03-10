$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "soft_deletable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "soft_delete"
  s.version     = SoftDeletable::VERSION
  s.authors     = ["John Cant"]
  s.email       = ["a.johncant@gmail.com"]
  s.homepage    = "http://www.behiring.com"
  s.summary     = "Laid back soft delete gem for Rails"
  s.description = "Laid back soft delete gem for Rails. Add a deleted_at column, and call soft_deletable from your model, and it's ready."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
