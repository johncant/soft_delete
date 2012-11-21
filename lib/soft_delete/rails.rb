module SoftDelete
  class Railtie < Rails::Railtie
    initializer "soft_delete.configure_rails_initialization" do
      ::ActiveRecord::Base.send(:include, ::SoftDeletable::Base)
      ::ActiveSupport::TestCase.send(:include, ::SoftDeletable::TestCase)
    end
  end
end
