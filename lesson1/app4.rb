#Вводим значение коэфициентов
puts "Введите первый коэффициент: "
a = gets.to_f
puts "Введите второй коэффициент: "
b = gets.to_f 
puts "Введите третий коэффициент: "
c = gets.to_f
#Вычисляем дискриминант
d = b**2 - 4*a*c
#Проверяем дискриминант и вычисляем квадратные корни
if d < 0
	puts "Корней нет!" 
	elsif d > 0
	x1 = (-b + Math.sqrt(d)) / (2 * a)  
	x2 = (-b - Math.sqrt(d)) / (2 * a)  
	puts "Первый корень равен: #{x1.to_f.round(2)}"	
	puts "Второй корень равен: #{x2.to_f.round(2)}"
	else
	x1 = -b / (2 * a)
	puts "Корень равен: #{x1.to_f.round(2)}"	
end	
