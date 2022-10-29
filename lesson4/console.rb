# frozen_string_literal: true

class Console
  include RailRoadMenu

  attr_reader :all_routes, :all_stations, :all_trains, :all_wagons

  def initialize
    @all_stations = []
    @all_routes = []
    @all_trains = []
    @all_wagons = []
  end

  STATION_MENU = ['Меню управления станцией',
                  '1 - создать станцию',
                  '2 - добавить/удалить поезд на станцию',
                  '3 - просмотреть список поездов на станции',
                  '4 - просмотреть список поездов на  всех станциях',
                  '5 - подробная информация о поездах на станции'].freeze

  TRAIN_MENU = ['Mеню управления поездом',
                '1 - создать поезд',
                '2 - установить маршрут поезду',
                '3 - добавить вагон к поезду',
                '4 - удалить вагон у поезда',
                '5 - просмотреть маршрут поезда',
                '6 - отправить поезд по маршруту(вперед/назад)'].freeze

  ROUTE_MENU = ['Mеню управления маршрутом',
                '1 - создать маршрут',
                '2 - добавить станцию в маршрут',
                '3 - Удалить станцию из маршрута'].freeze

  WAGON_MENU = ['Меню управления вагоном',
                '1 - Создать вагон',
                '2 - Занять/загрузить место в вагоне'].freeze

  def menu_railrod
    puts 'Основное меню железные дороги!'
    puts '1 - Меню управление станцией'
    puts '2 - Меню управление поездом'
    puts '3 - Меню управление маршрутом'
    puts '4 - Меню управление вагонами'
    puts '0 - выход'
  end

  def sub_menu_railroad(choice)
    case choice
    when 1
      station_menu
    when 2
      train_menu
    when 3
      route_menu
    when 4
      wagon_menu
    end
  end

  def station_menu
    puts STATION_MENU
    menu_choice
    case @choice
    when 1
      creat_station
    when 2
      add_sub_train_to_station
    when 3
      trains_on_station
    when 4
      all_train_on_all_stations
    when 5
      info_trains_on_station
    end
  end

  def train_menu
    puts TRAIN_MENU
    menu_choice
    case @choice
    when 1
      creat_train
    when 2
      set_route
    when 3
      plus_wagon
    when 4
      minus_wagon
    when 5
      train_route_info
    when 6
      moving_train
    end
  end

  def route_menu
    puts ROUTE_MENU
    menu_choice
    case @choice
    when 1
      create_route
    when 2
      route_add_station
    when 3
      route_sub_station
    end
  end

  def wagon_menu
    puts WAGON_MENU
    menu_choice
    case @choice
    when 1
      creat_wagon
    when 2
      load_wagon
    end
  end
end
