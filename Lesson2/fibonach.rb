mass = []
mass[0] = 0
mass[1] = 1
k = 1
while k < 11
  mass[k+1] = (mass[k]+mass[k-1])
  k += 1
end
print mass
