# frozen_string_literal: true

class Route
  include Validation
  include InstanceCounter

  attr_reader :stations, :begin_station, :end_station

  validate :begin_station, :presence, Station
  validate :end_station, :type, Station

  def initialize(begin_station, end_station)
    @begin_station = begin_station
    @end_station = end_station
    @stations = [begin_station, end_station]
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
