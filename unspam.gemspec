# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unspam/version'

Gem::Specification.new do |spec|
  spec.name          = 'unspam'
  spec.version       = Unspam::VERSION
  spec.authors       = ['Roland Moriz']
  spec.email         = ['roland@moriz.de']
  spec.summary       = %q(returns IP prefixes by ASN.)
  spec.description   = %q(returns IP prefixes by ASN.)
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
