require_relative "module"
require_relative "train"
require_relative "station"
require_relative "route"
require_relative "passenger_train"
require_relative "cargo_train"
require_relative "carriage"
require_relative "passenger_carriage"
require_relative "cargo_carriage"

class Menu
  attr_reader :trains, :stations, :routes

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def run
    main = Menu.new
    loop do
      puts ' Выберите действие:
      1.  Создать станцию
      2.  Создать поезд
      3.  Создать новый маршрут
      4.  Добавить станцию в маршрут
      5.  Удалить станцию из маршрута
      6.  Назначить маршрут поезду
      7.  Добавить вагоны к поезду
      8.  Отцепить вагоны от поезда
      9.  Переместить поезд по маршруту вперед и назад
      10. Вывести список станций
      11. Вывести список список поездов на станции
      12. Вывести список вагонов у поезда
      13. Занять место или объем в вагоне
      0.  Выход из программы'

      choise = gets.chomp.to_i

      break if choise == 0
      case choise
      when 1
        main.create_stations
        puts main.stations
      when 2
        main.create_trains
      when 3
        main.add_route
      when 4
        main.add_station_to_route
      when 5
        main.remove_station_to_route
      when 6
        main.set_route
      when 7
        main.add_carriage
      when 8
        main.delete_carriage
      when 9
        main.move_route
      when 10
        main.list_stations
      when 11
        main.list_trains
      when 12
        main.list_carriages
      when 13
        main.occupy_carriage
      else
        puts 'Выберите пункт из списка!'
      end
    end
  end

  protected

  attr_writer :routes, :trains, :stations

  def create_stations
    puts 'Введите название станции'
    name = gets.chomp
    one_station = Station.new(name)
    stations << one_station
  end

  def create_trains
    number_format = /^[a-zA-Zа-яА-Я0-9\s]{1,3}-*[a-zA-Zа-яА-Я0-9\s]{1,3}$/u

    begin
      puts 'Введите номер поезда'
      number = gets.chomp
      raise if number !~ number_format
    rescue
      puts 'Номер поезда не соответствует формату! Попробуйте еще раз'
      retry
    end
    begin
      puts 'Выберите тип создаваемого поезда:
      1. Пассажирский,
      2. Грузовой'
      type = gets.chomp.to_i
      if type == 1
        one_train = Train.new(number, :passenger)
      elsif type == 2
        one_train = Train.new(number, :cargo)
      end
      raise if type < 1 || type > 2
    rescue
        puts 'Введено неправильное значение! Введите 1 или 2. Попробуйте еще раз'
      retry
    end

    puts "Поезд номер #{one_train.number}, тип #{one_train.type} создан успешно!" if one_train != nil

    trains << one_train
  end

  def add_route
    puts 'Введите название первой станции маршрута:'
    begin_station = gets.chomp
    puts 'Введите название последней станции маршрута:'
    end_station = gets.chomp
    one_route = Route.new(begin_station, end_station)
    puts "Маршрут #{one_route} создан успешно"
    self.routes << one_route
  end

  def add_station_to_route
    one_route = select_route
    puts 'Введите название добавляемой станции в маршрут: '
    one_route.add_station(gets.chomp)
    p one_route
  end

  def remove_station_to_route
    one_route = select_route
    puts 'Введите название удаляемой станции из маршрута: '
    one_route.delete_station(gets.chomp)
    p one_route
  end

  def set_route
    if trains.size == 0
      puts 'Cписок поездов пуст! Сначала создайте поезда'
    else
      one_train = select_train
    end
    if routes.size == 0
      puts 'Cписок маршрутов пуст! Сначала создайте маршруты'
    else
      one_route = select_route
    end
    one_train.take_route(one_route)
  end

  def  add_carriage
    one_train = select_train
    puts 'Выберите тип вагона:
    1. Пассажирский,
    2. Грузовой'
    type = gets.chomp.to_i
    puts 'Укажите номер вагона: '
    number = gets.chomp
    if type == 1
      puts 'Введите количество мест в вагоне: '
      count_of_places = gets.chomp.to_i
      one_carriage = PassengerCarriage.new(number, count_of_places)
    elsif type == 2
      puts 'Введите объём вагона: '
      total_space = gets.chomp.to_i
      one_carriage = CargoCarriage.new(number, total_space)
    else
      puts 'Выберите значение из списка!'
    end
    one_train.carriage_add(one_carriage)
    p one_train.train
  end

  def delete_carriage
    one_train = select_train
    one_carriage = select_carriage(one_train)
    one_train.carriage_delete(one_carriage)
    puts one_train.train
  end

  def move_route
    one_train = select_train
    if one_train.route == nil
      puts 'Поезду не назначен маршрут!'
    else
      puts 'Выберите направление движения поезда:
      1. Вперед,
      2. Назад'
      choise = gets.chomp.to_i
      if choise == 1
        one_train.move_next_station
      elsif choise == 2
        one_train.move_previous_station
      else
        puts 'Выберите значение из списка!'
      end
      puts "Текущая станция #{one_train.station}"
    end
  end

  def list_stations
    puts 'Список станций: '
    stations.each { |station| puts station.name }
  end

  def list_trains
    one_station = select_station
    puts 'Список поездов на станции: '
    one_station.trains_in_station do |train|
      puts "Номер поезда: #{train.number} Тип: #{train.type},кол-во вагонов: #{train.train.size}"
    end
  end

  def list_carriages
    one_train = select_train
    puts 'Список вагонов поезда: '
    one_train.carriages_in_train do |carriage|
      str = "Номер: #{carriage.number}, тип: #{carriage.type}"
      if carriage.type == :passenger
        puts str + ", занято: #{carriage.taken_places}, свободно #{carriage.free_places}"
      elsif carriage.type == :cargo
        puts str + ", занято: #{carriage.occupied_space }, свободно #{carriage.free_space}"
      end
    end
  end

  def occupy_carriage
    one_train = select_train
    one_carriage = select_carriage(one_train)
    if one_carriage.class == PassengerCarriage
      puts 'Сколько мест будет занято?: '
      number = gets.chomp.to_i
      number.times { one_carriage.take_the_places }
      puts one_carriage
    elsif one_carriage.class == CargoCarriage
      puts 'Сколько объёма будет занято?: '
      space = gets.chomp.to_i
      one_carriage.occupy_space(space)
    end
  end

  def list_station_and_train
    puts 'Список станций: '
    stations.each { |station| puts station.name }
    puts 'Список поездов: '
    trains.each { |train| puts "Номер поезда: #{train.number} Тип: #{train.type}" }
  end

  def select_route
    puts 'Выберите маршрут из списка:'
    routes.each_index { |iroute| puts "#{iroute} - #{routes[iroute].stations.to_s}" }
    index_route = gets.chomp.to_i
    routes[index_route]
  end

  def select_station
    puts 'Выберите cтанцию из списка:'
    stations.each_index { |station| puts "#{station} - #{stations[station].name}" }
    index_station = gets.chomp.to_i
    stations[index_station]
  end

  def select_train
   puts 'Выберите поезд из списка:'
   trains.each_index { |train| puts "#{train} - #{trains[train].number} - #{trains[train].type}" }
   index_train = gets.chomp.to_i
   trains[index_train]
  end

  def select_carriage(one_train)
   puts 'Выберите вагон из состава:'
   one_train.train.each_index { |carriage| puts "#{carriage} - #{one_train.train[carriage]}" }
   index_carriage = gets.chomp.to_i
   one_train.train[index_carriage]
  end
end

menu = Menu.new
menu.run
