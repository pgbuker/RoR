class Station
  attr_reader :trains
   
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train_to_station(train)
    @trains << train
  end

  def send_train_from_station(train)
    @trains.each_with_index do |loco, index|
    if loco["number"] == train["number"] 
      @trains.delete_at(index)
    else
      puts "Этот проезд уже отправился со станции или не прибыл"
    end
  end
  end

  def show_all_trains
    puts "На станции #{@name} сейчас находятся поезда: "
    @trains.each_with_index {|train, index| puts "#{index + 1}. #{train}" }
  end

  def trains_count_by
    passanger_trains = @trains.count {|train| train["type"] == "passanger"}
    cargo_trains = @trains.count {|train| train["type"] == "cargo"}
    return passanger_trains
    return cargo_trains
  end

  def trains_by
    passanger_trains = @trains.select {|train| train["type"] == "passanger"}
    cargo_trains =  @trains.select {|train| train["type"] == "cargo"}
    return passanger_trains
    return cargo_trains
  end
end
