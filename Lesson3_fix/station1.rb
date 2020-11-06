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
    @trains.each do |train|
      if train.type == type
        return train
      end
    end
  end

  def departure_train(train)
    @trains.delete(train)
  end

end
