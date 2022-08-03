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
    @trains.delete(train)
  end

  def show_all_trains
    puts "На станции #{@name} сейчас находятся поезда: "
    @trains.each_with_index {|train, index| puts "#{index + 1}. #{train}" }
  end

  def trains_count_by(type)
    @trains.count {|train| train["type"] == type}
  end

  def trains_by(type)
    @trains.select {|train| train["type"] == type}
  end
end
