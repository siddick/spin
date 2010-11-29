Gem::Specification.new do |s|
  s.name            = "spin"
  s.version         = "1.0.0"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "Generators for Rails 3"

  s.description = <<-EOF
EOF

  s.files           = Dir['{bin/*,lib/**/*,test/**/*}'] +
                        %w(COPYING spec.gemspec Rakefile README)
  s.bindir          = 'bin'
#  s.executables     << 'rackup'
  s.require_path    = 'lib'
  s.has_rdoc        = true
  s.extra_rdoc_files = ['README.rdoc' ]
  s.test_files      = Dir['test/spec_*.rb']

  s.author          = 'Mohammed Siddick. E'
  s.email           = 'siddick@gmail.com'
  s.homepage        = 'http://github.com/siddick/spin'
#  s.rubyforge_project = 'rack'

  s.add_dependency 'jquery-rails'
  s.add_dependency 'will_paginate', '>= 3.0.pre2'
  s.add_dependency 'formtastic'
#  s.add_development_dependency 'rake'

#  s.add_development_dependency 'fcgi'
#  s.add_development_dependency 'memcache-client'
#  s.add_development_dependency 'mongrel'
#  s.add_development_dependency 'thin'
end
