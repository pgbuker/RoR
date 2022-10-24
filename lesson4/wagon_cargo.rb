class CargoWagon
  include Manufacture

  attr_reader :number, :type

  def initialize(number, volume)
    @type = "cargo"
    @volume = volume
    @occupate_volume = 0
    @number = number
    validate!
  end  

  NUMBER = /^\d+$/
  

  def take_volume
    if @occupate_volume < @volume
       @occupate_volume += 1
    else   
       puts "Место в вагоне заночилось!"
    end
   end
   
   def occupate_volume
     @occupate_volume   
   end
   
    def show_free_volume
     @free_volume = @volume - @occupate_volume
    end 
  


  def validate!
   raise 'Неправильный номер!' if  number !~ NUMBER
  end

  def valid?
    validate!
    true 
  rescue StandardError
    false
  end
end
