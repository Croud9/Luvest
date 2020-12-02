# frozen_string_literal: true

class Train
  include Producer
  include InstanceCounter

  @@trains = {}

  NUMBER_FORMAT = /^[a-zA-Zа-яА-Я0-9\s]{1,3}-*[a-zA-Zа-яА-Я0-9\s]{1,3}$/u.freeze

  attr_accessor :station
  attr_reader :number, :type, :route, :train, :speed

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
  rescue StandardError
    false
  end

  def carriage_add(carriage)
    raise 'Тип вагона должен соответствовать типу поезда!' if carriage.type != @type

    @train << carriage
  end

  def carriage_delete(carriage)
    @train.delete(carriage) if speed.zero? && !train.empty?
  end

  def take_route(route)
    @route = route
    self.station = self.route.stations.first
  end

  def move_next_station
    self.station = route.stations[route.stations.index(station) + 1] if station != route.stations.last
  end

  def move_previous_station
    self.station = route.stations[route.stations.index(station) - 1] if station != route.stations.first
  end

  def carriages_in_train(&block)
    @train.each(&block)
  end

  protected

  def validate!
    raise 'Номер не может быть пустым!' if number.nil?
    raise 'Номер не может быть короче 3 символов!' if number.length < 3
    raise 'Номер поезда не соответствует формату!' if number !~ NUMBER_FORMAT

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
