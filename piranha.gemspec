# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'piranha/version'

Gem::Specification.new do |spec|
  spec.name          = "piranha"
  spec.version       = Piranha::VERSION
  spec.authors       = ["Alexandre Colas"]
  spec.email         = ["colasalexandre@gmail.com"]
  spec.summary       = %q{PDF tools}
  spec.description   = %q{PDF tools}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"

  spec.add_runtime_dependency "activesupport", ">= 4.1.8"
  spec.add_runtime_dependency "wicked_pdf", "~> 0.11.0"
  spec.add_runtime_dependency "libreconv", "~> 0.9.0"
  spec.add_runtime_dependency "pdf-forms", "~> 0.6.0"
end
