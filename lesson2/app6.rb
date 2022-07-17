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

all = 0
products_hash.each_with_index do |(product, price_qunat_hash), index|
  print "#{index + 1}. #{product } #{price_qunat_hash} "
  price_qunat_hash.each do |price, quantity|
    sum = price * quantity
    print "Сумма: #{sum}"
    puts
    all += sum
  end
end
puts "Итого: #{all}" 

