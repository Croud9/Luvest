# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX
puts "Как тебя зовут?"
name = gets.chomp
puts "Какой у тебя рост?"
height = gets.chomp.to_i
ideal_weight = ((height - 110) * 1.15)
if ideal_weight > 0
  puts "#{name} ваш идеальный вес #{ideal_weight} "
else
  puts "#{name} ваш вес уже оптимальный"
end
