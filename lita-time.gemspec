Gem::Specification.new do |spec|
  spec.name          = "lita-time"
  spec.version       = "0.1.0"
  spec.authors       = ["Harlan Barnes"]
  spec.email         = ["hbarnes@pobox.com"]
  spec.description   = %q{A Lita handler for getting the curent time for a given location}
  spec.summary       = %q{A Lita handler for getting the curent time for a given location}
  spec.homepage      = "https://github.com/harlanbarnes/lita-time"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
