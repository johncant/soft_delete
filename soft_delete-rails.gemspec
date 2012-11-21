#$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require File.expand_path("../lib/soft_delete/version", __FILE__)

Gem::Specification.new "soft_delete-rails", SoftDelete::VERSION do |s|
  s.summary = "Simple and unobtrusive soft delete for rails"
  s.authors = ["John Cant"]
  s.email = "a.johncant@gmail.com"
  s.homepage = "http://github.com/johncant/soft_delete-rails"
  s.files = `git ls-files`.split("\n")
  s.license = 'MIT'
  s.require_path = 'lib'
end
