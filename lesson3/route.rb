class Route
  attr_reader :route_stations
  
  def initialize(first_station,last_station)
    @route_stations = [first_station, last_station]
  end

  def add_station(station)
   if @route_stations.include?(station)
    puts "Такая станция уже есть в маршруте!"
   else
    @route_stations.insert(-2, station)
   end
  end

  def sub_station(station)
    if station == @last_station || station == @first_station
      puts "Нельзя удалить начальную или конечную станцию"      
    else
      @route_stations.delete(station) 
    end
  end
end
