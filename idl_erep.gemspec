# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "idl_erep"
  spec.version       = "0.0.5"
  spec.authors       = ["Rintaro Okamura"]
  spec.email         = ["rintaro.okamura+github@gmail.com"]
  spec.summary       = %q{An enhanced interactive environment for IDL}
  spec.description   = %q{An enhanced interactive environment for IDL}
  spec.homepage      = "https://github.com/rinx/idl-erep"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_runtime_dependency "rb-readline", "~> 0"
end
