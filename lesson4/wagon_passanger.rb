class PassangerWagon
   include Manufacture
  
  attr_reader :number, :type

  def initialize(number, seats)
    @type = "passanger"
    @seats = seats
    @occupate_seats = 0
    @number = number
    validate!
  end 
  
  def take_seat
    if @occupate_seats < @seats
       @occupate_seats += 1
    else   
       puts "Места в вагоне заночились!"
    end
   end
 
   def occupate_seats
     @occupate_seats     
   end
   
    def show_vacant_seats
     @vacant = @seats - @occupate_seats
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
