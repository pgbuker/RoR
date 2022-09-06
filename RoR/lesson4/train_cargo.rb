class CargoTrain < Train

  attr_reader :current_station, :route_train, :speed, :number, :type, :quantity_wagons, :station_index, :direction_route

  def initialize(train)
    @number = train[:number]
    @type = train[:type]
    @quantity_wagons = train[:quantity_wagons]
    @speed = 0
    @station_index = 0
  end
end
