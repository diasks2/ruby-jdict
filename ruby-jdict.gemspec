# encoding: UTF-8
require File.expand_path('../lib/ruby-jdict/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'ruby-jdict'
  s.summary      = "Ruby gem for accessing Jim Breen's Japanese dictionaries"
  s.homepage     = 'https://github.com/jonathanb/ruby-jdict'
  s.require_path = 'lib'
  s.authors      = ['Jonathan Bryan']
  s.email        = ['jonathan@soliddesigngroup.net']
  s.version      = JDict::Version
  s.platform     = Gem::Platform::RUBY
  s.files        = Dir.glob("{examples,lib,spec}/**/*") + %w[LICENSING README Rakefile README.rdoc]

  s.add_dependency              'libxml-ruby', '~> 1.1.3'
  s.add_development_dependency  'rspec',       '~> 1.3.0'
end