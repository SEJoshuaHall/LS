def stringy(int)
  next_int = '1'
  str = ''
  int.times do
    str << next_int
    next_int = next_int == '1' ? next_int = '0' : next_int = '1'
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'