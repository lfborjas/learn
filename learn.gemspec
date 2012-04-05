# -*- encoding: utf-8 -*-
require File.expand_path('../lib/learn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["lfborjas"]
  gem.email         = ["luisfborjas@gmail.com"]
  gem.description   = %q{A gem for learning ruby and http}
  gem.summary       = %q{Companion gem for the progra4/teach site}
  gem.homepage      = "progra4.heroku.com/learn"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "learn"
  gem.require_paths = ["lib"]
  gem.version       = Learn::VERSION
  gem.add_dependency("rest-client", "~> 1.6.7")
  gem.add_dependency("thor", "~> 0.14.6")
  gem.add_dependency("json", "~> 1.6.5")
  gem.required_ruby_version = ">= 1.9.2"
end
