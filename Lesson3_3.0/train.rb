class Train
  attr_accessor :station
  attr_accessor :speed
  attr_reader :number
  attr_reader :type
  attr_reader :route
  attr_accessor :count

  def initialize(number, type, count)
    @speed = 0
    @number = number
    @type = type
    @count = count
  end

  def up_speed(speed)
    self.speed += speed
  end

  def brake
    self.speed = 0
  end

  def carriage_add
    if self.speed == 0
      self.count += 1
    else
      puts 'Brake first'
    end
  end

  def carriage_delete
    if self.speed == 0
      self.count -= 1
    else
      puts 'Brake first'
    end
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end

  def move_next_station
    return unless next_station
    station.delete_train(self)
    self.station = self.next_station
    station.add_train(self)
  end

  def move_previous_station
    return unless previous_station
    station.delete_train(self)
    self.station = self.previous_station
    station.add_train(self)
  end

  def previous_station
    if self.route.stations.include?(self)
      self.route.stations[self.route.stations.index(self.station) - 1]
    else
      puts "Станции нет"
    end
  end

  def next_station
    if self.route.stations.include?(self)
      self.route.stations[self.route.stations.index(self.station) + 1]
    else
      puts "Станции нет"
    end
  end
end
