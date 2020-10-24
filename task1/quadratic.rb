puts "Введите 3 коэффициента:"
print "a: "
a = gets.chomp.to_i
print "b: "
b = gets.chomp.to_i
print "c: "
c = gets.chomp.to_i
d = (b**2) - (4*a*c)
puts "Дискриминант: #{d}"
if d > 0
  x1 = (-b + Math.sqrt(d)) / (2*a)
  x2 = (-b - Math.sqrt(d)) / (2*a)
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  x = -b / (2*a)
  puts "x = #{x}"
else
  puts "Корней нет"
end
