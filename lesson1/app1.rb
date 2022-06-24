puts "Привет, как тебя зовут? "
name = gets.strip.capitalize 
puts "А какой твой рост? "
height = gets.to_i
ideal_weight = ((height - 110) * 1.15).to_f
if  ideal_weight < 0
	puts "#{name}, твой вес уже идеален!"
	else
	puts "#{name}, твой идеальный вес #{ideal_weight.round(2)}, задумайся!"
end
