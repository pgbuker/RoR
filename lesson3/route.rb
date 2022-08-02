class Route
  attr_accessor :route_stations
  
  def initialize(first_station,last_station)
    @route_stations = []
    @first_station = first_station
    @last_station = last_station
    @route_stations << first_station
    @route_stations << last_station
end

  def add_way_station(way_station)
   if @route_stations.include?(way_station)
    puts "Такая станция уже есть в маршруте!"
    elsif 
    @route_stations.insert(-2, way_station)
   end
  end

  def sub_way_station(way_station)
    if way_station == @last_station || way_station == @first_station
      puts "Нельзя удалить начальную или конечную станцию"      
    else
      @route_stations.delete(way_station) 
    end
  end

  def show_route
  puts @route_stations
  end
end
