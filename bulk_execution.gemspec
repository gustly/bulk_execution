# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bulk_execution/version'

Gem::Specification.new do |spec|
  spec.name          = "bulk_execution"
  spec.version       = BulkExecution::VERSION
  spec.authors       = ["Peter Swan"]
  spec.email         = ["pdswan@gmail.com"]
  spec.summary       = %q{Execute a block over a collection storing success and failure with the data that caused it.}
  spec.homepage      = "https://github.com/gustly/bulk_execution"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
