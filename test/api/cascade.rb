module Api
  module Cascade
    test "validation messages: returns translation from attribute scope" do
      cascade_options :step => 2, :skip_root => false, :scopes => [:model, :attribute]
      store_translations(:models => { :model => { :attributes => { :attribute => { :message => 'message' } } } })
      assert_equal 'message', message(:message, :model => 'model', :attribute => 'attribute').to_s
    end

    test "validation messages: returns translation from model scope" do
      cascade_options :step => 2, :skip_root => false, :scopes => [:model, :attribute]
      store_translations(:models => { :model => { :message => 'message' } })
      assert_equal 'message', message(:message, :model => 'model', :attribute => 'attribute').to_s
    end

    test "validation messages: returns translation from errors scope" do
      cascade_options :step => 2, :skip_root => false, :scopes => [:model, :attribute]
      store_translations(:message => 'message')
      assert_equal 'message', message(:message, :model => 'model', :attribute => 'attribute').to_s
    end

    test 'view helper: returns the :edit translation from the view path scope admin.sites.menu' do
      cascade_options :step => 1, :skip_root => false, :offset => 2
      store_translations(:admin => { :sites => { :menu => { :edit => 'edit' } } })
      assert_equal 'edit', message(:edit, :scope => 'admin.sites.menu').to_s
    end

    test 'view helper: returns the :edit translation from the view path scope admin.menu' do
      cascade_options :step => 1, :skip_root => false, :offset => 2
      store_translations(:admin => { :menu => { :edit => 'edit' } })
      assert_equal 'edit', message(:edit, :scope => 'admin.sites.menu').to_s
    end

    test 'view helper: returns the :edit translation from the view path scope menu' do
      cascade_options :step => 1, :skip_root => false, :offset => 2
      store_translations(:menu => { :edit => 'edit' })
      assert_equal 'edit', message(:edit, :scope => 'admin.sites.menu').to_s
    end

    # currently not supported by I18n::Cascade because of the way :offset is used
    #
    # test 'view helper: returns the :edit translation from the root scope' do
    #   cascade_options :step => 1, :skip_root => false, :offset => 2
    #   store_translations(:edit => 'edit')
    #   assert_equal 'edit', message(:edit, :scope => 'admin.sites.menu').to_s
    # end
  end
end
