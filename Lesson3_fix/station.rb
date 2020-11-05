class Station
  attr_reader :name_station, :trains

  def initialize(name_station)
    @trains = []
    @name_station = name_station
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.each do |train|
      if train.type == type
        puts train
      end
    end
  end

  def departure_train(train)
    @trains.delete(train)
  end

end
