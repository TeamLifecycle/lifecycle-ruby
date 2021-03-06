# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lifecycle_api/version'

Gem::Specification.new do |spec|
  spec.name          = "lifecycle_api"
  spec.version       = Lifecycle::VERSION
  spec.authors       = ["Jake Mooney"]
  spec.email         = ["jrmooney@gmail.com"]

  spec.summary       = %q{The official gem for making clean and easy api calls to your lifecycle account. OFFICIAL LIFECYCLE API GEM}
  spec.description   = %q{Check our more on details regarding installation and usage at https://github.com/TeamLifecycle/lifecycle-ruby}
  spec.homepage      = "https://www.lifecycle.io/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"

  spec.add_dependency "unirest"


end
