# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'soft_delete/version'

Gem::Specification.new do |spec|
  spec.name          = 'soft_delete'
  spec.version       = SoftDelete::VERSION
  spec.authors       = ['Alexander Borovykh']
  spec.email         = ['immaculate.pine@gmail.com']

  spec.summary       = 'Softy delete your ActiveRecord records'
  spec.homepage      = 'https://github.com/ImmaculatePine/soft_delete'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
