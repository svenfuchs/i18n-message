$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'test/unit'
require 'test_case_declarative'
require 'api'

require 'i18n/message'

class Test::Unit::TestCase
  def teardown
    I18n.backend  = nil
  end
  
  def message(*args)
    self.class.const_get(:Message).new(*args)
  end

  def store_translations(data)
    I18n.backend.store_translations(:en, data)
  end
end

class CascadingBackend < I18n::Backend::Simple
  include I18n::Backend::Cascade
end
