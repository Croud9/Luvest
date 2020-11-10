class Station
  attr_reader :name, :trains

  def initialize(name)
    @trains = []
    @name = name
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.filter { |train| train.type == type }
    return [*train]
  end

  def delete_train(train)
    @trains.delete(train)
  end

end
