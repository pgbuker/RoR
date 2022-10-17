
require_relative 'manufacture.rb'
require_relative 'instance_counter'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passanger.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passanger.rb'
require_relative 'console.rb'


 @console = Console.new


loop do
  @console.menu_railrod
  puts "Введите номер: "
  choice = gets.to_i
  break if choice.zero?
  @console.sub_menu_railroad(choice)
  
end
