class CargoWagon
  include Manufacture

  attr_reader :number, :type

  def initialize(number)
    @type = "cargo"
    @number = number
  end  
end
