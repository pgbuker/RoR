class Route
  
  attr_reader :route_stations, :first_station, :last_station
  
  def initialize(first_station,last_station)
    @route_stations = [first_station, last_station]
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
end

route = Route.new("MSK", "SPB")
