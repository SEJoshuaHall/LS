def integer_validity(int)
  if int.to_i.to_s == int
    true
  else
    false
  end
end

first_five = []
sixth = nil

puts "This program checks to see if the 6th number you enter is among the first 5."

loop do
  puts "Please enter your first number: "
  first = gets.chomp
  unless integer_validity(first) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(first)
  first_five << first.to_i
  break
end

loop do
  puts "Please enter your second number: "
  second = gets.chomp
  unless integer_validity(second) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(second)
  first_five << second.to_i
  break
end

loop do
  puts "Please enter your third number: "
  third = gets.chomp
  unless integer_validity(third) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(third)
  first_five << third.to_i
  break
end

loop do
  puts "Please enter your fouth number: "
  fourth = gets.chomp
  unless integer_validity(fourth) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(fourth)
  first_five << fourth.to_i
  break
end

loop do
  puts "Please enter your fifth number: "
  fifth = gets.chomp
  unless integer_validity(fifth) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(fifth)
  first_five << fifth.to_i
  break
end

loop do
  puts "Please enter your sixth number: "
  sixth = gets.chomp
  unless integer_validity(sixth) 
    puts "Invalid number, please try again."
  end
  next unless integer_validity(sixth)
  sixth = sixth.to_i
  break
end

if first_five.include?(sixth)
  puts "The number #{sixth} appears in #{first_five}."
else
  puts "The number #{sixth} does not appear in #{first_five}."
end