def integer_to_string(int)
  return '0' if int == 0
  hsh = (0..9).zip(('0'..'9')).to_h
  result = ''
  until int == 0 do
    current = int % 10
    int = int / 10
    result = hsh[current] + result
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

def signed_integer_to_string(int)
  if int > 0
    return integer_to_string(int)
  elsif int < 0
    return -integer_to_string(-int)
  else
    return '0'
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'