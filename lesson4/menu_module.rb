# frozen_string_literal: true

module RailRoadMenu
  ADDSUBTRAIN = ['1 - добавить поезд на станцию',
                 '2 - удалить поезд со станции'].freeze

  CREATTRAIN = ['Выберите тип поезда',
                '1 - Пассажирский поезд',
                '2 - Грузовой поезд'].freeze

  MOVINGTRAIN = ['1 - отправить поезд вперед по маршруту',
                 '2 - отправить поезд назад маршруту'].freeze

  CREATWAGON = ['Выберите тип вагона',
                '1 - Пассажирский вагон',
                '2 - Грузовой вагон'].freeze

  def menu_choice
    puts 'Введите номер: '
    @choice = gets.to_i
  end

  def train_choice
    puts 'Выберите поезд по номеру из списка: '
    all_trains_list
    train_id = gets.to_i
    @all_trains[train_id]
  end

  def station_choice
    puts 'Выберите станцию по номеру из списка: '
    all_stations_list
    station_id = gets.to_i
    @all_stations[station_id]
  end

  def route_choice
    puts 'Выберите маршрут по номеру из  списка: '
    all_routes_list
    route_id = gets.to_i
    @all_routes[route_id]
  end

  def wagon_choice
    puts 'Выберите вагон по номеру из  списка: '
    all_wagons_list
    wagon_id = gets.to_i
    @all_wagons[wagon_id]
  end

  def add_sub_train_to_station
    puts ADDSUBTRAIN
    menu_choice
    station = station_choice
    train = train_choice
    case @choice
    when 1
      station.take_train_to_station(train)
    when 2
      station.send_train_from_station(train)
    end
  rescue StandardError => e
    show_exception(e)
  end

  def trains_on_station
    station = station_choice
    station.show_all_trains
  rescue StandardError => e
    show_exception(e)
  end

  def all_train_on_all_stations
    @all_stations.each do |station|
      puts "#{station.name}: "
      station.gives_all_trains do |train|
        puts "Номер: #{train.number}, Тип: #{train.type} Кол-во вагонов: #{train.wagons_array.count}"
      end
    end
  end

  def info_trains_on_station
    station = station_choice
    puts "Станция #{station.name}: "
    station.trains.each do |train|
      puts "Номер поезда #{train.number}: "
      train.gives_wagons_info do |wagon|
        case wagon.type
        when 'passanger'
          free_value = wagon.show_vacant_seats
          occupate_value = wagon.occupate_seats
        when 'cargo'
          free_value = wagon.show_free_volume
          occupate_value = wagon.occupate_volume
        end
        puts "Номер вагона:#{wagon.number}, Тип вагона:#{wagon.type}, Кол-во свободного места:#{free_value}, Кол-во занятого места:#{occupate_value}"
      end
    end
  rescue StandardError => e
    show_exception(e)
  end

  def creat_train
    puts CREATTRAIN
    type = gets.to_i
    puts 'Введите номер поезда: '
    number = gets.chomp
    case type
    when 1
      train = PassangerTrain.new(number)
      @all_trains << train
      puts "Пассажирский поезд № #{number} создан!"
    when 2
      train = CargoTrain.new(number)
      @all_trains << train
      puts "Грузовой поезд № #{number} создан!"
    end
  rescue StandardError => e
    show_exception(e)
  end

  def set_route
    train = train_choice
    route = route_choice
    train.setting_route(route)
  rescue StandardError => e
    show_exception(e)
  end

  def plus_wagon
    train = train_choice
    wagon = wagon_choice
    train.add_wagon(wagon)
  rescue StandardError => e
    show_exception(e)
  end

  def minus_wagon
    train = train_choice
    wagon = wagon_choice
    train.sub_wagon(wagon.number)
  rescue StandardError => e
    show_exception(e)
  end

  def train_route_info
    train = train_choice
    if train.route_train.nil?
      puts 'Для этого поезда не установлен маршрут!'
    else
      train.info_route
    end
  rescue StandardError => e
    show_exception(e)
  end

  def moving_train
    train = train_choice
    puts MOVINGTRAIN
    menu_choice
    case @choice
    when 1
      train.moving_forward_train
    when 2
      train.moving_back_train
    end
    puts train.current_station.name
  rescue StandardError => e
    show_exception(e)
  end

  def create_route
    puts 'Выберите начальную станцию маршрута из списка: '
    station = station_choice
    first_station = station
    puts 'Введите конечную станцию маршрута из списка: '
    station = station_choice
    last_station = station
    route = Route.new(first_station, last_station)
    @all_routes << route
  rescue StandardError => e
    show_exception(e)
  end

  def route_add_station
    puts 'Выберите маршрут по номеру из списка: '
    route = route_choice
    puts 'Выберите станцию по номеру из  списка: '
    station = station_choice
    route.add_station(station)
    puts 'Станции в маршруте: '
    route.route_stations.each_with_index { |stn, index| puts "#{index}. #{stn.name}" }
  rescue StandardError => e
    show_exception(e)
  end

  def route_sub_station
    puts 'Выберите маршрут по номеру из списка: '
    route = route_choice
    puts 'Выберите станцию по номеру из  списка: '
    station = station_choice
    route.sub_station(station)
    puts 'Станции в маршруте: '
    route.route_stations.each_with_index { |stn, index| puts "#{index}. #{stn.name}" }
  rescue StandardError => e
    show_exception(e)
  end

  def creat_wagon
    puts CREATWAGON
    type = gets.to_i
    puts 'Введите номер вагона: '
    number = gets.chomp
    case type
    when 1
      puts 'Введите кол-во мест: '
      seats = gets.to_i
      wagon = PassangerWagon.new(number, seats)
      @all_wagons << wagon
      puts "Пассажирский вагон № #{number} создан!"
    when 2
      puts 'Введите объем вагона: '
      volume = gets.to_i
      wagon = CargoWagon.new(number, volume)
      @all_wagons << wagon
      puts "Грузовой вагон № #{number} создан!"
    end
  rescue StandardError => e
    show_exception(e)
  end

  def load_wagon
    wagon = wagon_choice
    case wagon.type
    when 'passanger'
      wagon.take_seat
      puts "Занято одно место в пассажирском вагоне №#{wagon.number}"
    when 'cargo'
      wagon.take_volume
      puts "Занято одна единица объема в грузовом вагоне №#{wagon.number}"
    end
  rescue StandardError => e
    show_exception(e)
  end

  def all_trains_list
    @all_trains.each_with_index { |train, index| puts "#{index}.  № #{train.number}" }
  end

  def all_stations_list
    @all_stations.each_with_index { |station, index| puts "#{index}.  #{station.name}" }
  end

  def all_routes_list
    @all_routes.each_with_index { |route, index| puts "#{index}.  #{route}" }
  end

  def all_wagons_list
    @all_wagons.each_with_index { |wagon, index| puts "#{index}.  № #{wagon.number}, #{wagon.type} " }
  end

  def creat_station
    puts 'Введите название станции: '
    station = Station.new(gets.chomp.capitalize)
    @all_stations << station
  end

  def show_exception(exception)
    puts 'Неправильно введены данные!'
    puts " #{exception.message} "
  end
end
