puts 'Введите дату:'
print 'День: '
day = gets.chomp.to_i
print 'Месяц: '
month = gets.chomp.to_i
print 'Год: '
year = gets.chomp.to_i

days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
if((year % 4 == 0) || (year % 400 == 0) && year % 100 != 0)
  days_in_month[1] += 1
end
total = days_in_month.take(month - 1).sum + day

puts "Порядковый номер даты, начиная с начала года: #{total}"
