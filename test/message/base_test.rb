require File.expand_path('../../test_helper', __FILE__)

class I18nMessageBaseTest < Test::Unit::TestCase
  class Message < I18n::Message
  end

  def setup
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.send(:init_translations) # so our translations won't be overwritten by Rails
  end

  include Api::Base
  # include Api::NonFormatted
end
