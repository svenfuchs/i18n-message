require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class I18nMessageCascadeTest < Test::Unit::TestCase
  class Message < I18n::Message
    include Cascade
  end

  def setup
    I18n.backend  = CascadingBackend.new
  end

  def teardown
    cascade_options :step => 2, :skip_root => true
    super
  end

  include Api::Base
  include Api::Cascade
end

class I18nMessageCascadeVariantsTest < I18nMessageCascadeTest
  class Message < I18nMessageCascadeTest::Message
    include Variants
  end

  include Api::Variants
end
