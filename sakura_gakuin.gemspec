# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sakura_gakuin/version'

Gem::Specification.new do |spec|
  spec.name          = "sakura_gakuin"
  spec.version       = SakuraGakuin::VERSION
  spec.authors       = ["Yoshida Tetsuya"]
  spec.email         = ["yoshida.eth0@gmail.com"]
  spec.description   = %q{All about Japanese idol "Sakura Gakuin", that consists of limited to growth period girls only.}
  spec.summary       = %q{All about Japanese idol "Sakura Gakuin", that consists of limited to growth period girls only.}
  spec.homepage      = "https://github.com/yoshida-eth0/ruby-sakura_gakuin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "activesupport"
end
