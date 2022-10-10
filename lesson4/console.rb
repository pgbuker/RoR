class Console

  attr_reader :all_routes, :all_stations, :all_trains, :all_wagons

  def initialize
    @all_stations = []
    @all_routes = []
    @all_trains = []
    @all_wagons = []
  end
  
  def menu_railrod
    puts "Основное меню железные дороги!"
    puts "1 - меню управление станцией" 
    puts "2 - меню управление поездом" 
    puts "3 - управление маршрутом" 
    puts "0 - выход" 
  end

  def sub_menu_railroad(choice)
    case choice 
    when 1
      station_menu
    when 2 
      train_menu
    when 3  
      route_menu
    end  
    
  end

  
def menu_choice
  puts "Введите номер: "
  @choice = gets.to_i
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
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Выберите станцию по номеру из списка: "
    all_stations_list
    station_id = gets.to_i  
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    elsif @choice == 1 
      station.take_train_to_station(train)
    elsif @choice == 2
      station.send_train_from_station(train)
    else
      puts "Неправильно выбран пункт меню!!!"
    end
  end
  when 3
    puts "Выберите станцию по номеру из  списка: "
    all_stations_list
    station_id = gets.to_i  
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    station.show_all_trains  
    end
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
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Выберите маршрут по номеру из  списка: "
    all_routes_list
    route_id = gets.to_i  
    route = @all_routes[route_id]
    if route.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    train.setting_route(route)
    end
  end
  when 3
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Выберите вагон по номеру из  списка: "
    all_wagons_list
    wagon_id = gets.to_i  
    wagon = @all_wagons[wagon_id]
    if wagon.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    train.add_wagon(wagon)
    end
  end
  when 4
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Вагоны поезда: "
    train.wagons_array.each_with_index {|wagon, index| puts "#{index }: #{wagon.number}" }
    puts "Выберите вагон по номеру из  списка: "
    all_wagons_list
    wagon_id = gets.to_i  
    wagon = @all_wagons[wagon_id]
    if wagon.nil?
    puts "Неправильно выбран номер из списка!"
    else 
    train.sub_wagon(wagon.number)
    end
  end
  when 5
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    elsif  train.route_train.nil?
    puts "Для этого поезда не установлен маршрут!"  
    else 
    train.info_route
    end
  when 6
    puts "1 - отправить поезд вперед по маршруту"
    puts "2 - отправить поезд назад маршруту"
    menu_choice
    puts "Выберите поезд по номеру из списка: "
    all_trains_list
    train_id = gets.to_i   
    train = @all_trains[train_id]
    if train.nil?
    puts "Неправильно выбран номер из списка!" 
    else
      if @choice == 1 
       train.moving_forward_train
       puts "Текущая станция: "
       puts train.current_station.name
      elsif @choice == 2
       train.moving_back_train
       puts "Текущая станция: "
       puts train.current_station.name
      else
       puts "Неправильно введена команда"
      end
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
    puts "Введите начальную станцию маршрута из списка: "
    station_id = gets.to_i  
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    first_station = station
    puts "Введите конечную станцию маршрута из списка: "
    station_id = gets.to_i  
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    last_station = station
    route = Route.new(first_station, last_station)
    @all_routes << route
    end
  end
  when 2
    puts "Выберите маршрут из списка: "
    all_routes_list
    puts "Выберите маршрут по номеру из  списка: "
    all_routes_list
    route_id = gets.to_i  
    route = @all_routes[route_id]
    if route.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Выберите станцию по номеру из  списка: "
    all_stations_list
    station_id = gets.to_i  
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    route.add_station(station)
    puts "Станции в маршруте: "
    route.route_stations.each_with_index {|station, index|  puts "#{index}. #{station.name}"}
    end 
  end  
  when 3
    puts "Выберите маршрут по номеру из  списка: "
    all_routes_list
    route_id = gets.to_i
    route = @all_routes[route_id]
    if route.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    puts "Станции в маршруте: "
    route.route_stations.each_with_index {|station, index|  puts "#{index}. #{station.name}"}
    puts "Выберите станцию по номеру из  списка: "
    all_stations_list
    station_id = gets.to_i
    station = @all_stations[station_id]
    if station.nil?
    puts "Неправильно выбран номер из списка!" 
    else
    route.sub_station(station)
    end
  end
  when 0
    menu_railrod
  else
    puts "Неправильно выбран пункт меню!!!"
  end
end

private


def all_trains_list
  @all_trains.each_with_index {|train, index| puts "#{index}.  № #{train.number}" }  
end

def all_stations_list
  @all_stations.each_with_index {|station, index| puts "#{index }.  #{station.name}" }  
end

def all_routes_list
  @all_routes.each_with_index {|route, index| puts "#{index}.  #{route}" }  
end

def all_wagons_list
  @all_wagons.each_with_index {|wagon, index| puts "#{index}.  № #{wagon.number}, #{wagon.type} " }  
end


def creat_station
  puts "Введите название станции: "
  station = Station.new(gets.chomp.capitalize)
  @all_stations << station
end

def creat_train
  puts "Введите номер поезда: "
  number = gets.to_i
  puts "Введите тип поезда(cargo/passanger): "
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

end
