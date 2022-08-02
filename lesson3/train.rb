class Train

  attr_accessor :speed, :number, :type, :quantity_wagons, :number_station_route
  attr_reader :station_route, :route_train
  @speed = 0
  @number_station_route = 0

  def initialize(train)
    self.number = train[:number]
    self.type = train[:type]
    self.quantity_wagons = train[:quantity_wagons]
  end
  
  #Набирает скорость
  def start
    self.speed = rand(1..80)
  end

  #Останавливается
  def stop
    self.speed = 0
  end
  
  #Возвращает текущую скорость
  def control_speed
    return @speed
  end
  
  #Возвращает количество вагонов
  def sum_wagon
    return @quantity_wagons
  end

  #Прицепляем один вагон
  def add_wagon
    if @speed != 0
      puts "Нельзя прицепить вагон, так как поезд движется!"
    else
      @quantity_wagons += 1
    end
  end

  #Отцепляем один вагон
  def sub_wagon
    if @speed != 0
      puts "Нельзя отцепить вагон, так как поезд движется!!"
    elsif
      @quantity_wagons == 0
      puts "Уже нечего отцеплять остался только локомотив!"
    else 
      @quantity_wagons -= 1  
    end
  end

  #Устанавливаем маршрут для поезда и помещаем на первую станцию
  def setting_route
    @route_train = Route::route_stations
    @station_route = @route_train[0]
  end

  #Отправляем поезд на одну станцию вперед и возвращаем текущую, предыдущую и следующую станции
  def moving_forward_train
    if @station_route == @route_train[-1]
    puts "Вы доехали до конечной станции. Возможно движение только назад!"
    elsif
      @number_station_route += 1
    end 
    return @station_route = @route_train[@number_station_route] 
    return previous_station = @route_train[@number_station_route - 1]
    return next_station = @route_train[@number_station_route + 1]

  end

  #Отправляем поезд на одну станцию назад и возвращаем текущую, предыдущую и следующую станции
  def moving_back_train
    if @station_route == @route_train[0]
      puts "Вы на первой станции. Возможно движение только вперед!"
    elsif 
      @number_station_route -= 1
    end
    return @station_route = @route_train[@number_station_route] 
    return previous_station = @route_train[@number_station_route + 1]
    return next_station = @route_train[@number_station_route - 1]    
  end

end
