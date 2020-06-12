# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geekbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'geekbot'
  spec.version       = Geekbot::VERSION
  spec.authors       = %w[Pegasus204 eitoball]
  spec.email         = ['tenma.fukaya@misoca.jp', 'eitoball@gmail.com']

  spec.summary       = 'Geekbot API client library, written in Ruby'
  spec.description   = 'Geekbot API client library, written in Ruby'
  spec.homepage      = 'https://github.com/standfirm/geekbot_ruby'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
