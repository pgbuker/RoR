
  #  
  # @spb = Station.new('СПб')
  # @msk = Station.new('МСК')
  # train = {:number => 23, :type => "passanger"}
  # @train1 = Train.new(train)
  # @spb.take_train_to_station(train)
  # @route1 = Route.new("SPB", "Moscow")
  # @route1 = Route.new(@spb, @msk)
  # @route1.add_station("5 km")
  # @route1.add_station("Kolpino")
  # @train1.setting_route(@route1::route_stations)
  # @wagon1 = CargoWagon.new("cargo", 2344)@
  # @wagon2 = CargoWagon.new("cargo", 5555)
  # @wagon3 = PassangerWagon.new("passanger", 42)
  # @train1.add_wagon(@wagon1::wagondata)
  # @train1.add_wagon(@wagon2::wagondata)
  # @train1.add_wagon(@wagon3::wagondata)
  # @train1.wagons_count
  # @train1.sub_wagon(42)
  # @train1.wagons_count
  # @spb.show_all_trains
# #  @cargotrain1 = CargoTrain.new(:number => 2341, :type => "cargo")


  station = Station.new('СПб')
  @all_stations << station
  # first_station = station 
  
  station = Station.new('МСК')
  @all_stations << station
  # last_station = station
  
  station = Station.new('Kolpino')
   @all_stations << station


  # route1 = Route.new(first_station,last_station)
  # @all_routes << route1

  train = CargoTrain.new(23)
  @all_trains << train  
  train = PassangerTrain.new(42)
  @all_trains << train  

  wagon = CargoWagon.new(234567)
  @all_wagons << wagon  
  wagon = PassangerWagon.new(424242)
  @all_wagons << wagon  
