
require_relative 'manufacture.rb'
require_relative 'instance_counter'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passanger.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passanger.rb'
require_relative 'console.rb'


@console = Console.new


station = Station.new('SPb')
@console.all_stations << station
first_station = @console.all_stations[0] 

station = Station.new('MSK')
@console.all_stations << station
last_station = @console.all_stations[1]

station = Station.new('Kolpino')
@console.all_stations << station

train = PassangerTrain.new('42434')
@console.all_trains << train 

train = CargoTrain.new('23234')
@console.all_trains << train  

wagon = CargoWagon.new('234567', 20)
@console.all_wagons << wagon  

wagon = PassangerWagon.new('424242', 50)
@console.all_wagons << wagon 
 

route = Route.new(first_station,last_station)
@console.all_routes << route
station = @console.all_stations[2]
route = @console.all_routes[0]
route.add_station(station)


station = @console.all_stations[0]
wagon = @console.all_wagons[1]
train = @console.all_trains[0]
train.setting_route(route)
station.take_train_to_station(train)
train.add_wagon(wagon)


station = @console.all_stations[0]
wagon = @console.all_wagons[0]
train = @console.all_trains[1]
train.setting_route(route)
station.take_train_to_station(train)
train.add_wagon(wagon)


loop do
  @console.menu_railrod
  puts "Введите номер: "
  choice = gets.to_i
  break if choice.zero?
  @console.sub_menu_railroad(choice)
  
end


