class PassangerWagon
  include Manufacture
  
  attr_reader :number, :type

  def initialize(number)
    @type = "passanger"
    @number = number
  end  
end
