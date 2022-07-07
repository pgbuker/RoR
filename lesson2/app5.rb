#Хэш с колическвом дней в невисокосном году
year_hash = {
  January: 31,
  February: 28,
  March: 31,
  Aprill: 30,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October: 31,
  November: 30,
  December: 31
}
#Просим пользователя ввести дату
puts "Введите число месяца: "
day = gets.to_i
puts "Введите месяц: "
month = gets.to_i
puts "Введите год"
year = gets.to_i
#Определяем високосный ли год
if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
  leap = 1 
elsif 
  year % 4 == 0 && year % 100 == 0 && year % 400 != 0
  leap = 0
elsif
  year % 4 == 0 && year % 100 != 0
  leap = 1  
else
  leap = 0
end
#Вычисляем номер дня
count_day = 0
year_arr = year_hash.values
year_arr.each_with_index do |days, index|
  if index < month - 1 
  count_day += days
  end
end
#Добавляем один день если год високосный и выводим порядковый номер дня
case leap
when 0
count_day += day
when 1
count_day += day + leap
end  
puts "Порядковый номер даты: #{count_day}" 
