
module SoftDeletable

  module InstanceMethods

    def self.included(base)
      base.class_eval do
        alias_method :hard_delete, :delete
        alias_method :delete, :soft_delete
        alias_method :hard_destroy, :destroy
        alias_method :destroy, :soft_destroy
      end
    end

    def soft_delete
      puts "Soft deleting #{self.inspect}"
      update_attribute :deleted_at, Time.now
    end

    def soft_destroy
      _run_destroy_callbacks do
        destroy_associations
        delete
      end
    end


#    default_scope where()

#    def self.included(base)
#      base.reflect_on_all_associations.each do |a|
#        if a.collection
#        a.class_name.constantize.send :define_method,  do
#      end
#    end
  end


  module Base
    def self.included(base)
       base.extend ClassMethods
    end
 
    module ClassMethods

      def soft_deletable
        include SoftDeletable::InstanceMethods
        scope :not_deleted, where(:deleted_at => nil)
        scope :deleted, where("#{self.to_s.underscore.pluralize.to_sym}.deleted_at IS NOT NULL")
      end

    end
  end

  module TestCase

    def assert_soft_deleted(record, msg=nil)
      full_message = build_message(msg, "? has not been soft deleted", record.inspect)
      assert_block(full_message) do
        record.deleted_at != nil
      end
    end

    def assert_not_soft_deleted(record, msg=nil)
      full_message = build_message(msg, "? was soft deleted at", record.inspect, record.deleted_at)
      assert_block(full_message) do
        record.deleted_at == nil
      end
    end

  end
end

::ActiveRecord::Base.send(:include, ::SoftDeletable::Base)
::ActiveSupport::TestCase.send(:include, ::SoftDeletable::TestCase)
