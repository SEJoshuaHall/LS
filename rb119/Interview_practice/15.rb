=begin
take str fo nhumeric digits, return greatest product of 4 consec digits

EXAMPLES

DATA
input string of digits
array of 4 consec digits
output int

ALG
set subs to all sets of 4 consec digits
  0 to length - 4 slice
transform strs in subs to ints, digits, inject *
return greatest value of subs

=end

def greatest_product(str)
  subs = []
  (0..(str.length - 4)).each do |start|
    subs << str.slice(start, 4)
  end
  subs.map {|str| str.to_i.digits.inject(:*)}.max
end
    
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6