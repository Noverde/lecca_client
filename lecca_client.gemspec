# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lecca_client/version'

Gem::Specification.new do |spec|
  spec.name          = "lecca_client"
  spec.version       = LeccaClient::VERSION
  spec.authors       = ["Noverde Team", "Rafael Izidoro"]
  spec.email         = ["dev@noverde.com.br", "izidoro.rafa@gmail.com"]

  spec.summary       = %q{Lecca DTVM LTDA integration}
  spec.description   = %q{This gem is responsible for exchange proposal and CNAB files between your system and Lecca DTVM.}
  spec.homepage      = "https://github.com/noverde/lecca_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'testftpd', "~> 0.2"

  spec.add_dependency "hashie", "~> 3.4"
  spec.add_dependency "activesupport", "~> 5.0"
  spec.add_dependency "pry-byebug", "~> 3.4"
end
