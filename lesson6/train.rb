class Train

  include Producer
  include InstanceCounter

  @@trains = {}

  NUMBER_FORMAT = /^[a-zA-Zа-яА-Я0-9\s]{1,3}-*[a-zA-Zа-яА-Я0-9\s]{1,3}$/u


  attr_reader :station, :speed, :number, :type, :route, :train
  attr_writer :speed, :station, :train

  def initialize(number, type)
    @speed = 0
    @number = number
    @type = type
    @train = []
    validate!
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def valid?
    validate!
  rescue
    false
  end

  def carriage_add(carriage)
    raise 'Тип вагона должен соответствовать типу поезда!' if vagon.type != @type
      self.train << carriage
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

  protected

  def validate!
    raise "Номер не может быть пустым!" if number.nil?
    raise "Номер не может быть короче 3 символов!" if number.length < 3
    raise "Номер поезда не соответствует формату!" if number !~ NUMBER_FORMAT
    true
  end

  private

  def up_speed(speed)
    self.speed += speed
  end

  def brake
    self.speed = 0
  end

end
