class Station

  include InstanceCounter

  @@stations = []

  def self.all
    @@stations
  end

  attr_reader :name, :trains

  def initialize(name)
    @trains = []
    @name = name
    validate!
    @@stations << self
    register_instance
  end

  def valid?
    validate!
  rescue
    false
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

  protected
  
  def validate!
    raise "Название станции не может быть пустым!" if name.nil? || name.length == 0
    true
  end

end
