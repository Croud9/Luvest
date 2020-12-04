# frozen_string_literal: true

module Producer
  attr_accessor :producer
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instance

    def instances
      if instance.nil?
        0
      else
        instance
      end
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instance ||= 0
      self.class.instance += 1
    end
  end
end
