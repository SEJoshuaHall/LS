bottles = 99

until bottles == 0
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer!"
  bottles -= 1
  puts "Take one down, pass it around, #{bottles} bottles of beer on the wall!"
end