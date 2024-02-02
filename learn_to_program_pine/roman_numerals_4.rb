def roman_to_integer(numeral)
  total = 0
  numerals = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
  numeral.each do |numerale|
    total += numerals[numerale]
  end
  puts total
end

puts "Welcome to the Roman Numeral to Integer Converter!"
puts "What Roman Numeral would you like converted?"
user_numeral = gets.chomp.upcase.split(//)
puts
roman_to_integer(user_numeral)