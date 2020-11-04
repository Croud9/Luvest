class Station
  attr_reader :name_station, :trains

  def initialize(name_station)
    @trains = []
    @name_station = name_station
  end

  def imput_train(train)
    self.trains << train
  end

  def trains_type(type)
    self.trains.each {|train|
      if train.type == type
        puts train
      end
    }
  end

  def departure_train(train)
    self.trains.delete(train)
  end
end
