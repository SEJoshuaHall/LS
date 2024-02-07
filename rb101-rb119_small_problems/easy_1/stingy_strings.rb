def stringy(size, n = "1")
  numbers = []
  if n.to_s == "1"
  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end
  elsif n.to_s == "0"
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
  end
  end
  numbers.join
end

puts stringy(6, 1) == '101010'
puts stringy(9, 0) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'