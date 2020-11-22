module Producer

  attr_accessor :producer

end

module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def instances
      @instances
    end

    def counter_up
      @instances ||= 0
      @instances += 1
    end

  end

  module InstanceMethods

    def register_instance
      self.class.send :counter_up
    end

  end
  
end
