puts 'Введите дату:'
print 'День: '
day = gets.chomp.to_i
print 'Месяц: '
month = gets.chomp.to_i
print 'Год: '
year = gets.chomp.to_i

days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
total = 0
total += day
  for d in 1...month
   total += days_in_month[d]
 end

 if((year % 4 == 0) || (year % 400 == 0) && year % 100 != 0)
  total += 1
end
 puts "Порядковый номер даты, начиная с начала года: #{total}"
