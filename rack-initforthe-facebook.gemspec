# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/initforthe/facebook/version"

Gem::Specification.new do |s|
  s.name        = "rack-initforthe-facebook"
  s.version     = Rack::Initforthe::Facebook::VERSION
  s.authors     = ["Rob Holland"]
  s.email       = ["rob@initforthe.com"]
  s.homepage    = "http://github.com/initforthe/rack-initforthe-facebook"
  s.summary     = %q{Rack middleware for Facebook applications}
  s.description = %q{Rack middleware for Facebook applications}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
