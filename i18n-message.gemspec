# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'i18n/message/version'

Gem::Specification.new do |s|
  s.name         = "i18n-message"
  s.version      = I18n::Message::VERSION
  s.authors      = ["Sven Fuchs"]
  s.email        = "svenfuchs@artweb-design.de"
  s.homepage     = "http://github.com/svenfuchs/i18n-message"
  s.summary      = "I18n::Message is an object-oriented abstraction for looking up translations from I18n.translate"
  s.description  = "I18n::Message is an object-oriented abstraction for looking up translations from I18n.translate. This is useful for storing lookup information in contexts such as ActiveModel validation error I18n."

  s.files        = Dir.glob("{lib/**/*,[A-Z]*}")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'

  s.add_dependency 'i18n'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'test_declarative'
end
