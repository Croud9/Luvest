# frozen_string_literal: true

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(begin_station, end_station)
    @stations = []
    @stations << begin_station
    @stations << end_station
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
