def string_to_integer(str)
  str = str.chars
  sign = ''
  if str[0] == '-'
    sign = '-'
    str.shift
  elsif str[0] == '+'
    str.shift
  else
    str
  end
    num_lookup = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  counter = 0
  nums = []
  idx = 1
  total = 0
  str.each do |e|
    nums << num_lookup[e]
  end
  loop do
    total += (nums[-idx] * (10**(idx - 1)))
    idx += 1
    break if idx > nums.length
  end
  if sign == '-'
    total *= -1
  else
    total
  end
end

# p string_to_integer('-4321') == -4321
# p string_to_integer('4321') == 4321
# p string_to_integer('+570') == 570

