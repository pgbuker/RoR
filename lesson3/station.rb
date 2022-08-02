class Station
  attr_accessor :trains
   
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train_to_station(train)
    @trains << train
  end

  def send_train_from_station(number)
    
    @trains.each_with_index do |train, index|
    if train["number"] == number 
      @trains.delete_at(index)
    else
      
      puts "Этот проезд уже отправился со станции или не прибыл"
    end
  end
  end

  def show_all_trains
    puts "На станции #{@name} сейчас находятся поезда: "
    @trains.each_with_index {|train, index| puts "#{index + 1}. #{train}" }
    return @trains
  end

  def show_qauntity_of_type_trains
    passanger = 0
    cargo = 0
    @trains.each do |train| 
      if train["type"] == "passanger"
        passanger += 1
      
      elsif train["type"] == "cargo"
        cargo += 1
      
      else
      puts "Не указан тип поезда"
      end
    end
    return passanger
    return cargo
    puts "Пассажирских поездов: #{passanger}, Грузовых поездов: #{cargo}"
  end  
end
