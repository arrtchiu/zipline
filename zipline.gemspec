# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zipline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ram Dobson"]
  gem.email         = ["ram.dobson@solsystemscompany.com"]
  gem.description   = %q{this is a giant pile of hax that may let you stream dynamically generated zip files}
  gem.summary       = %q{stream zip files from rails}
  gem.homepage      = "http://github.com/fringd/zipline"

  gem.files         = `git ls-files`.split($\) - %w{.gitignore}
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zipline"
  gem.require_paths = ["lib"]
  gem.version       = Zipline::VERSION

  gem.add_dependency 'rubyzip', ['>= 1.0', '<= 1.1.2']
  gem.add_development_dependency 'curb'
  gem.add_development_dependency 'fog'
  gem.add_development_dependency 'carrierwave'
  gem.add_development_dependency 'paperclip'
  gem.add_development_dependency 'rspec', '~> 3.0.0.beta'
end
