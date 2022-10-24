class Train
 extend InstanceCounter::ClassMethods
 include InstanceCounter::InstanceMethods
 include Manufacture

 @@all_trains = []

  class << self
    
    attr_accessor :all_trains
    def find_number(number)
      @@all_trains.select {|train| train.number == number}
    end
  end

  attr_reader :current_station, :route_train, :speed, :number, :type, :station_index, :wagons_array

  def initialize(number)
    @number = number
    @speed = 0
    @station_index = 0
    @wagons_array = []
    @@all_trains << self
    register_instance
    validate!
  end

  NUMBER = /^[a-z0-9]{3}-?+[a-z0-9]{2}$/i

#Используется непосредственно из меню пользователя  
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
#Используется непосредственно из меню пользователя
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
#Используется непосредственно из меню пользователя
  def info_route
    puts "Станции маршрута: "
    @route_train.route_stations.each_with_index {|station, index|  puts "#{index + 1}.  #{station.name}" }
  end

#Используется непосредственно из меню пользователя
  def setting_route(route)
      @route_train = route
      @current_station = route.first_station
  end
#Используется непосредственно из меню пользователя
  def moving_forward_train
    if @current_station == @route_train.route_stations[-1]
    puts "Вы доехали до конечной станции. Возможно движение только назад!"
    else
      @station_index += 1
      @current_station = @route_train.route_stations[station_index]
    end
  end
#Используется непосредственно из меню пользователя
  def moving_back_train
    if @route_train.route_stations[@station_index] == @route_train.route_stations[0]
      puts "Вы на первой станции. Возможно движение только вперед!"
    else 
      @station_index -= 1
      @current_station = route_train.route_stations[station_index]
    end  
  end

  def gives_all_wagons(&block)
    puts "Все вагоны поезда:"
    @wagons_array.each(&block)
  end

#Используется непосредственно из меню пользовател
  def current_station
    @current_station
  end

  def print_wagons_info
    # {|wagon| puts "Номер вагона : #{wagon.number}, Тип вагона: #{wagon.type} Кол-во вагонов: #{train.wagons_array.count}" } 
    gives_wagons_info do |wagon|
      case wagon.type
      when "passanger"
        free_value = wagon.show_vacant_seats
        occupate_value = wagon.occupate_seats
      when "cargo"
        free_value = wagon.show_free_volume
        occupate_value = wagon.occupate_volume
      end  
        
      puts "Номер вагона : #{wagon.number}, Тип вагона: #{wagon.type}, Кол-во свободного места: #{free_value}, Кол-во занятого места: #{occupate_value}"  
    end   
  end


  private


  def gives_wagons_info(&block)
    puts "Вагоны поезда:"
    @wagons_array.each {|wagon| block.call(wagon)}
    
  end


  #Используется внутри класса, нет вызова из меню пользователя
  def previous_station
    @route_train.route_stations[@station_index - 1] 
  end
#Используется внутри класса, нет вызова из меню пользователя
  def next_station
    @route_train.route_stations[@station_index + 1]
  end

#Используется внутри класса, нет вызова из меню пользователя
  def start
    @speed = rand(1..80)
  end
  #Используется внутри класса, нет вызова из меню пользователя
  def stop
    @speed = 0
  end
  #Используется внутри класса, нет вызова из меню пользователя
  def control_speed
    @speed
  end
  #Используется внутри класса, нет вызова из меню пользователя
  def wagons_count
    @wagons_array.count { |wagon| wagon.number }   
  end

  def validate!
    raise "Неправильный номер!" if number !~ NUMBER 
  end

  def valid?
    validate!
    true 
  rescue StandardError 
    false
  end
end
