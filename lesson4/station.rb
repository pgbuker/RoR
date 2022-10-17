class Station
extend InstanceCounter::ClassMethods
include InstanceCounter::InstanceMethods


  class << self
    attr_accessor :all_stations
  end

  attr_reader :trains, :name
 
  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end


#Используется непосредственно из меню пользователя
  def take_train_to_station(train)
    @trains << train  
    puts @trains
  end
#Используется непосредственно из меню пользователя
  def send_train_from_station(train)
    @trains.delete(train)
  end
#Используется непосредственно из меню пользователя
  def show_all_trains
    puts "На станции #{@name} сейчас находятся поезда: "
    @trains.each_with_index { |train, index| puts "#{index + 1}. № #{train.number}" }
  end
private
#Используется внутри класса, нет вызова из меню пользователя
  def trains_count_by(type)
    @trains.count { |train| train.type == type}
  end
#Используется внутри класса, нет вызова из меню пользователя
  def trains_by(type)
    @trains.select { |train| train.type == type}
  end
end
