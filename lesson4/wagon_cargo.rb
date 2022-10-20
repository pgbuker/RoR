class CargoWagon
  include Manufacture

  attr_reader :number, :type

  def initialize(number)
    @type = "cargo"
    @number = number
    validate!
  end  

  NUMBER = /^\d+$/

  def validate!
    raise "Неправильный номер!" if number !~ NUMBER 
  end

  def valid?
    validate!
    true 
  rescue StandartError
    false
  end
end
