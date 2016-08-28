# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'base64_stream/version'

Gem::Specification.new do |spec|
  spec.name          = "base64_stream"
  spec.version       = Base64Stream::VERSION
  spec.authors       = ["aetherus"]
  spec.email         = ["aetherus.zhou@gmail.com"]

  spec.summary       = %q{Stream in and out Base64 data.}
  spec.description   = %q{
    Base64_stream based on the idea of IO to lower memory consumption
    when converting big files from and to base64 files.
  }
  spec.homepage      = "https://github.com/aetherus/base64_stream"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "faker"
end
