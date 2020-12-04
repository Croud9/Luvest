# frozen_string_literal: true

class Station
  include Accessors
  include Validation
  include InstanceCounter

  @@stations = []

  def self.all
    @@stations
  end

  attr_accessor_with_history :ert
  strong_attr_accessor :erp, String
  attr_reader :name, :trains

  validate :name, :presence

  def initialize(name)
    @trains = []
    @name = name
    validate!
    @@stations << self
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.filter { |train| train.type == type }
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def trains_in_station(&block)
    @trains.each(&block)
  end
end
