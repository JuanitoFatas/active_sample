# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_sample/version"

Gem::Specification.new do |spec|
  spec.name          = "active_sample"
  spec.version       = ActiveSample::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %(Sample functionality for Active Record.)
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JuanitoFatas/active_sample"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
