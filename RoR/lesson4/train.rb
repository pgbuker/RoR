class Train
 
  attr_reader :current_station, :route_train, :speed, :number, :type, :station_index, :wagons_array

  def initialize(number)
    @number = number
    @speed = 0
    @station_index = 0
    @wagons_array = []
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
  def wagons_count
    @wagons_array.count { |wagon| wagon.number }   
  end

  def add_wagon(wagon)
    if @speed != 0 
      puts "Нельзя прицепить вагон, поезд движется!"
    elsif
      wagon.type == @type
      @wagons_array << wagon
    else
      puts "Не тот тип вагона!!!"  
    end
  end

  #Отцепляем один вагон
  def sub_wagon(number)
    if @speed != 0
      puts "Нельзя отцепить вагон, поезд движется!!"
    elsif
      @wagons_array.empty?
      puts "Уже нечего отцеплять остался только локомотив!"
    else 
      @wagons_array.reject! { |wagon| wagon.number == number} 
    end
  end

  def info_route
    puts "Станции маршрута: "
    @route_train.route_stations.each_with_index {|station, index|  puts "#{index + 1}.  #{station.name}" }
  end


  #Устанавливаем маршрут для поезда и помещаем на первую станцию
  def setting_route(route)
      @route_train = route
      @current_station = route.first_station
  end

  #Отправляем поезд на одну станцию вперед
  def moving_forward_train
    if @current_station == @route_train.route_stations[-1]
    puts "Вы доехали до конечной станции. Возможно движение только назад!"
    else
      @station_index += 1
      @current_station = @route_train.route_stations[station_index]
    end
  end

  #Отправляем поезд на одну станцию назад
  def moving_back_train
    if @route_train.route_stations[@station_index] == @route_train.route_stations[0]
      puts "Вы на первой станции. Возможно движение только вперед!"
    else 
      @station_index -= 1
      @current_station = route_train.route_stations[station_index]
    end  
  end
#Возвращаем текущую станцию
  def current_station
    @current_station
  end
#Возвращаем предыдущую станцию 
  def previous_station
    @route_train.route_stations[@station_index - 1] 
  end
#Возвращаем следующую станцию
  def next_station
    @route_train.route_stations[@station_index + 1]
  end
end

