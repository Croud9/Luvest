fibo_numbers = [0, 1]
k = 1

loop do
  if fibo_numbers[k] <= 100
    fibo_numbers.push(fibo_numbers[k] + fibo_numbers[k - 1])
    k += 1
  else
    fibo_numbers.pop
    break
  end
end

print fibo_numbers
