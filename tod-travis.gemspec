
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tod/version'

Gem::Specification.new do |spec|
  spec.name          = 'tod-travis'
  spec.version       = Tod::VERSION
  spec.authors       = ['mckomo']
  spec.email         = ['mckomo@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'Run travis.yml in your terminal'
  spec.description   = 'Helper utility to run scripts from .travis.yml file'
  spec.homepage      = 'http://mckomo.github.io'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 5.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'mocha', '~> 1.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53'
end
