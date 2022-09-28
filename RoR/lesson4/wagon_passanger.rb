class PassangerWagon
  attr_reader :number, :type

  def initialize(number)
    @type = "passanger"
    @number = number
  end  
end
