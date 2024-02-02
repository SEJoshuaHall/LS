
def roman_numeral(user_number)
  if user_number / 1000 != nil
    print "M"*(user_number/1000)
  end
  user_number = user_number % 1000
  if user_number / 500 != nil
    print "D"*(user_number/500)
  end
  user_number = user_number % 500
  if user_number / 100 != nil
    print "C"*(user_number/100)
  end
  user_number = user_number % 100
  if user_number / 50 != nil
    print "L"*(user_number/50)
  end
  user_number = user_number % 50
  if user_number / 10 != nil
    print "X"*(user_number/10)
  end
  user_number = user_number % 10

  #Check for necessity of placing "I" before "V"
  if user_number >7
    print "V"
    print "I" * (user_number % 7)
    print "V"
    user_number = 0
  elsif user_number > 2 && user_number < 5
    print "I" * (user_number % 7)
    print "V"
    user_number = 0
  end

  if user_number / 5 != nil
  print "V"*(user_number/5)
  end
  user_number = user_number % 5
  if user_number / 1 != nil
  print "I"*(user_number/1)
  end
  user_number = user_number % 1
  puts
end

puts "Welcome to the Roman Numeral Generator!"
puts "What number would you like converted?"
user_number = gets.chomp.to_i
roman_numeral(user_number)