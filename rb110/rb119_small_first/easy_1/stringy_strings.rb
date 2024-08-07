def stringy(int, reverse = true)
  str = ''
  if reverse == false
    str << '0'
    int -= 1
  end
  loop do
    return str if int == 0 
    str << '1'
    int -= 1
    return str if int == 0 
    str << '0'
    int -= 1
    return str if int == 0 
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
    
puts stringy(6)

puts stringy(6, false)