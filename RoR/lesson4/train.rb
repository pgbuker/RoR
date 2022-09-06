class Train
 
  attr_reader :current_station, :route_train, :speed, :number, :type, :quantity_wagons, :station_index, :direction_route

  def initialize(train)
    @number = train[:number]
    @type = train[:type]
    @quantity_wagons = train[:quantity_wagons]
    @speed = 0
    @station_index = 0
  end
  
  #Набирает скорость
  def start
    @speed = rand(1..80)
  end

  #Останавливается
  def stop
    @speed = 0
  end
  
  #Возвращает текущую скорость
  def control_speed
    @speed
  end
  
  #Возвращает количество вагонов
  def sum_wagon
    @quantity_wagons
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
  def setting_route(route_stations)
    @route_train = route_stations
    @current_station = @route_train[0]
  end

  #Отправляем поезд на одну станцию вперед
  def moving_forward_train
    if @current_station = @route_train[-1]
    puts "Вы доехали до конечной станции. Возможно движение только назад!"
    else
      @station_index += 1
      @current_station = route_train[station_index]
    end
  end

  #Отправляем поезд на одну станцию назад
  def moving_back_train
    if @route_train[@station_index] == @route_train[0]
      puts "Вы на первой станции. Возможно движение только вперед!"
    else 
      @station_index -= 1
      @current_station = route_train[station_index]
    end  
  end
#Возвращаем текущую станцию
  def current_station
    @current_station
  end
#Возвращаем предыдущую станцию 
  def previous_station
    @route_train[@station_index - 1] 
  end
#Возвращаем следующую станцию
  def next_station
    @route_train[@station_index + 1]
  end
end


