@all_stations = []
@all_trains = []
@all_routes = []
@all_wagons = []

require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passanger.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passanger.rb'
#require_relative 'seed.rb'

def all_trains_list
  @all_trains.each_with_index {|train, index| puts "#{index + 1}.  № #{train.number}" }  
end

def all_stations_list
  @all_stations.each_with_index {|station, index| puts "#{index + 1}.  #{station.name}" }  
end

def all_routes_list
  @all_routes.each_with_index {|route, index| puts "#{index + 1}.  #{route}" }  
end

def all_wagons_list
  @all_wagons.each_with_index {|wagon, index| puts "#{index + 1}.  № #{wagon.number}, #{wagon.type} " }  
end

def select_train
  puts "Выберите поезд по номеру из списка: "
  all_trains_list
  train_id = gets.to_i - 1 
  @train = @all_trains[train_id]
end

def select_station
  puts "Выберите станцию по номеру из  списка: "
  all_stations_list
  station_id = gets.to_i - 1
  @station = @all_stations[station_id]
end

def select_route
  puts "Выберите маршрут по номеру из  списка: "
  all_routes_list
  route_id = gets.to_i - 1
  @route = @all_routes[route_id]
end

def select_wagon
  puts "Выберите вагон по номеру из  списка: "
  all_wagons_list
  wagon_id = gets.to_i - 1
  @wagon = @all_wagons[wagon_id]
end

def creat_station
  puts "Введите название станции: "
  station = Station.new(gets.chomp.capitalize)
  @all_stations << station
end

def creat_route
  route = Route.new(@first_station, @last_station)
  @all_routes << route
end

def creat_train
  puts "Введите номер поезда: "
  number = gets.to_i
  puts "Введите тип поезда(cargo/passenger): "
  type = gets.chomp
  if type == "cargo"
    train = CargoTrain.new(number)
  elsif type == "passanger"
    train = PassangerTrain.new(number)
  else
    puts "Нет такого типа поезда"
  end  
  @all_trains << train
end

def menu_choice
  puts "Введите: "
  @choice = gets.to_i
end

def menu_railrod
  puts "Основное меню железные дороги!"
  puts "1 - меню управление станцией" 
  puts "2 - меню управление поездом" 
  puts "3 - управление маршрутом" 
  puts "0 - выход" 
end

def station_menu
  puts "меню управления станцией"
  puts "1 - создать станцию"
  puts "2 - добавить/удалить поезд на станцию"
  puts "3 - просмотреть список поездов на станции"
  puts "0 - выход в основное меню"
  menu_choice
  case @choice
  when 1
    creat_station 
    all_stations_list
  when 2
    puts "1 - добавить поезд на станцию"
    puts "2 - удалить поезд со станции"    
    menu_choice
    select_train
    select_station
    if @choice == 1 
      @station.take_train_to_station(@train)
    elsif @choice == 2
      @station.send_train_from_station(@train)
    else
      puts "Неправильно выбран пункт меню!!!"
    end
  when 3
    select_station
    station.show_all_trains  
  when 0
    menu_railrod
  else
    puts "Неправильно выбран пункт меню!!!"
  end
end

def train_menu
  puts "меню управления поездом"
  puts "1 - создать поезд"
  puts "2 - установить маршрут поезду"
  puts "3 - добавить вагон к поезду"
  puts "4 - удалить вагон у поезда"
  puts "5 - просмотреть маршрут поезда"
  puts "6 - отправить поезд по маршруту(вперед/назад)"
  puts "0 - выход в основное меню"
  menu_choice
  case @choice
  when 1
    creat_train
    all_trains_list
  when 2
    select_train
    select_route
    @train.setting_route(@route)
  when 3
    select_train
    select_wagon
    @train.add_wagon(@wagon)
  when 4
    select_train
    puts "Вагоны поезда: "
    puts @train.wagons_array.each_with_index {|number, index| "#{index + 1 }: #{number}" }
    select_wagon
    @train.sub_wagon(@wagon.number)
  when 5
    select_train
    @train.info_route
  when 6
    puts "1 - отправить поезд вперед по маршруту"
    puts "2 - отправить поезд назад маршруту"
    menu_choice
    select_train
   if @choice == 1 
    @train.moving_forward_train
    @train.current_station
   elsif @choice == 2
    @train.moving_back_train
    @train.current_station
   else
    puts "Неправильно введена команда"
   end
  when 0
    menu_railrod
  else
    puts "Неправильно выбран пункт меню!!!"  
  end
end

def route_menu
  puts "меню управления маршрутом"
  puts "1 - создать маршрут"
  puts "2 - добавить станцию в маршрут"
  puts "3 - Удалить станцию из маршрута"
  puts "0 - выход в основное меню"  
  menu_choice
  case @choice
  when 1
    puts "Имеющиеся станции:"
    all_stations_list
    puts "Начальная станцию маршрута"
    select_station
    @first_station = @station
    puts "Конечная станцию маршрута"
    select_station
    @last_station = @station
    creat_route   
  when 2
    puts "Выберите маршрут из списка: "
    all_routes_list
    select_route
    select_station
    @route.add_station(@station)
    puts "Станции в маршруте: "
    @route.route_stations.each_with_index {|station, index|  puts "#{index + 1}. #{station.name}"}
  when 3
    puts "Выберите маршрут из списка: "
    all_routes_list
    select_route
    puts "Станции в маршруте: "
    @route.route_stations.each_with_index {|station, index|  puts "#{index + 1}. #{station.name}"}
    select_station
    @route.sub_station(@station)
  when 0
    menu_railrod
  else
    puts "Неправильно выбран пункт меню!!!"
  end
end

loop do
  #Общее меню ЖД(управление станцией, управление поездом, управление маршрутом, выход)
  menu_railrod
  menu_choice
  case @choice 
  when 1
    station_menu
  when 2 
    train_menu
  when 3  
    route_menu
  when 0
    break
  end  
end
