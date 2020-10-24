puts "Введите 3 стороны треугольника"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

if (a==b)&&(b==c)&&(c==a)
  puts "Треугольник равносторонний"
  abort
elsif (a==b)||(b==c)||(c==a)
  puts "Тругольник равнобедренный"
  abort
else
  puts "Треугольник не равносторонний и не равнобедренный"
end

if (a>b)&&(a>c)
  gip = a
  x = b
  y = c
elsif (b>a)&&(b>c)
  gip = b
  x = a
  y = c
else
  gip = c
  x = a
  y = b
end
if (gip**2) == (x**2 + y**2)
  puts "Треугольник прямоугольный"
elsif
  puts "И не прямоугольный"
else
  puts "Это обычный треугольник со сторонами: a = #{a}, b = #{b}, c = #{c} "
end
