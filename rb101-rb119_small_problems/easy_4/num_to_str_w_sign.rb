

def integer_to_string(int)
  result = ''
  conversion_hsh = {1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'}
  integer_arr = int.digits.reverse
  integer_arr.each do |e|
    result << conversion_hsh[e]
  end
  result
end

def signed_integer_to_string(int)
  sign = ''
  if int < 0
    sign = '-'
    int *= -1
  end
  result = integer_to_string(int)
  if result == '0'
    return result
  elsif sign == '-'
    return result.prepend '-'
  else 
    return result.prepend '+'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'