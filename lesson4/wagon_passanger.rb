class PassangerWagon
  include Manufacture
  
  attr_reader :number, :type

  def initialize(number)
    @type = "passanger"
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
  rescue StandardError
    false
  end
end
