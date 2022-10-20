class Route
extend InstanceCounter::ClassMethods
include InstanceCounter::InstanceMethods

  attr_reader :route_stations, :first_station, :last_station
  
  def initialize(first_station,last_station)
    @first_station = first_station
    @last_station = last_station
    @route_stations = [first_station, last_station]
    register_instance
    validate!
  end
#Используется непосредственно из меню пользователя
  def add_station(station)
    if @route_stations.include?(station)
      puts "Такая станция уже есть в маршруте!"
    else
      @route_stations.insert(-2, station)
    end
  end
#Используется непосредственно из меню пользователя
  def sub_station(station)
    if station == @route_stations[0] || station == @route_stations[-1]
      puts "Нельзя удалить начальную или конечную станцию"      
    else
      @route_stations.delete(station) 
    end
  end

# protected

  def validate!
    raise 'Нет начальной станции!' if  Station.all_stations.select {|station| station.name != @first_station}.empty?
    raise 'Нет конечной станции!' if Station.all_stations.select {|station| station.name != @last_station}.empty?
  end

  def valid?
    validate!
    true 
  rescue StandartError
    false
  end

end


