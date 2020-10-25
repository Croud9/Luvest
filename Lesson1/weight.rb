puts 'Как тебя зовут?'
name = gets.chomp
puts 'Какой у тебя рост?'
height = gets.chomp.to_i
ideal_weight = ((height - 110) * 1.15)
if ideal_weight > 0
  puts "#{name} ваш идеальный вес #{ideal_weight} "
else
  puts "#{name} ваш вес уже оптимальный"
end
