class Train
  attr_reader :station, :speed, :number, :type, :route, :train
  attr_writer :speed, :station, :train

  def initialize(number, type)
    @speed = 0
    @number = number
    @type = type
    @train = []
  end

  def carriage_add(carriage)
    if self.speed == 0 && carriage.type == @type
      self.train << carriage
    else
      puts 'Присоединение вагона происходит только при полной остановке поезда и тип вагона должен соответствовать типу поезда!'
    end
  end

  def carriage_delete(carriage)
    if self.speed == 0 && train.size > 0
      self.train.delete(carriage)
    else
      puts 'Отсоединение вагона происходит только при полной остановке поезда, имеющего вагоны!'
    end
  end

  def take_route(route)
    @route = route
    self.station = self.route.stations.first
  end

  def move_next_station
    if station != route.stations.last
      self.station = self.route.stations[self.route.stations.index(self.station) + 1]
    else
      puts "Станция #{@station} является конечной. Поезд не может двигаться вперед"
    end
  end

  def move_previous_station
    if station != route.stations.first
      self.station = self.route.stations[self.route.stations.index(self.station) - 1]
    else
      puts "Станция #{@station} является отправной. Поезд не может двигаться назад"
    end
  end

  private

  def up_speed(speed)
    self.speed += speed
  end

  def brake
    self.speed = 0
  end

end
