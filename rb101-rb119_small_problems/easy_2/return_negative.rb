def negative(int)
  if int == int.abs  
  int = int * -1
  else 
    return int
  end
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0