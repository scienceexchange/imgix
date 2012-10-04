# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imgix/version'

Gem::Specification.new do |gem|
  gem.name          = "imgix"
  gem.version       = Imgix::VERSION
  gem.authors       = ["Ryan Abbott"]
  gem.email         = ["abbottry@gmail.com"]
  gem.description   = %q{Simply generate imgix tags}
  gem.summary       = %q{imgix generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
