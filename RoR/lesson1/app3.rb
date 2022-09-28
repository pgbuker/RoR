puts "Введите первую сторону треугольника: "
a = gets.to_i
puts "Введите вторую сторону треугольника: "
b = gets.to_i
puts "Введите третью сторону треугольника: "
c = gets.to_i
if a < b && c <= a
	hyp = b
	cat1 = a
	cat2 = c
	elsif b < a && c <= b
	hyp = a
	cat1 = b
	cat2 = c
	else 
	hyp = c
	cat1 = b
	cat2 = a	
end	
	
if hyp**2 == cat1**2 + cat2**2
	puts "Треугольник прямоугольный"
	elsif a == b && b == c
	puts "Треуголник равносторонний  и равнобедренный"
	else
	puts "Это просто треугольник"		
end
