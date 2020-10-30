shop = {}
puts 'Введите (стоп) для завершения'

loop do
  puts 'Введите название продукта'
  product = gets.chomp
  break if product == "стоп"
  puts 'Введите цену(руб)'
  price = gets.chomp.to_f
  puts 'Введите количество'
  number = gets.chomp.to_f
  shop[product] = { price => number }
end

total = 0
shop.each do |product, price|
  puts "#{product} стоит #{price.keys.first * price.values.first}"
  total += price.keys.first * price.values.first
end
puts "Итог: #{total} руб"
