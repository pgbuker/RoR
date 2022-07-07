products_hash = {}

loop do
  price_qunat_hash = {}
  puts "Введите товар  (Введите стоп для окончания ввода): "
  product = gets.strip.capitalize
    if product == "Стоп".to_s
      break
    end
  puts "Введите цену товара за единицу: "
  price = gets.to_f
  puts "Введите кол-во купленного товара: "
  quantity = gets.to_f
  price_qunat_hash[price] = quantity
  products_hash[product] = price_qunat_hash
end

i = 1
all = 0
products_hash.each do |key,value|
  print "#{i }. #{key } #{value} "
  i += 1
  value.each do |p, q|
    sum = p * q
    print "Сумма: #{sum}"
    puts
    all += sum
  end
end
puts "Итого: #{all}" 

