=begin

PROBLEM
write method to take integer and print diamond of '*'s at the width of the integer


EXAMPLES

diamond(3)

 *
***
 *

DATA
Input: Integer
array of odds to integer
Output: printout to screen


ALGORYTHM
build array of odds 1 through input
for each element in array print a line
  take element and subtract from input and divide by two and print this number of spaces followed by element number of *s and new line


CODE
=end

def diamond(int)
  arr = *(1..int)
  puts
  arr.each do |num|
    if num.odd?
      puts "#{' '*((int - num) / 2)}#{'*'*num}"
    end
  end
  arr.pop
  arr.reverse!
  arr.each do |num|
    if num.odd?
      puts "#{' '*((int - num) / 2)}#{'*'*num}"
    end
  end
end


diamond(1)
diamond(3)
diamond(9)

def diamond_outline(int)
  arr = *(1..int)
  puts
  arr.each do |num|
    if num == 1
      puts "#{' '*((int - num) / 2)}#{'*'*num}"
    elsif num.odd?
      puts "#{' '*((int - num) / 2)}*#{' '*(num-2)}*"
    end
  end
  arr.pop
  arr.reverse!
  arr.each do |num|
    if num == 1
      puts "#{' '*((int - num) / 2)}#{'*'*num}"
    elsif num.odd?
        puts "#{' '*((int - num) / 2)}*#{' '*(num-2)}*"
    end
  end
end


diamond_outline(1)
diamond_outline(3)
diamond_outline(9)