# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spin/version"

Gem::Specification.new do |s|
  s.name        = "spin"
  s.version     = Spin::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mohammed siddick. E"]
  s.email       = ["siddick@gmail.com"]
  s.homepage    = "http://github.com/siddick/spin"
  s.summary     = %q{Wrapper for the Scaffold}
  s.description = %q{Override the template provided by the Scaffold}

  s.rubyforge_project = "spin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'will_paginate', '>= 3.0.pre2'
  s.add_dependency 'formtastic'

end
