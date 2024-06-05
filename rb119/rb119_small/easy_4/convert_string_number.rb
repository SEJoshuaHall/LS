def string_to_integer(str)
  hsh = ('0'..'9').zip((0..9)).to_h
  arr_ints = str.chars.map {|e| hsh[e]}
  result = 0
  str.length.times {|count| result += ((arr_ints[-(count+1)]) * 10 ** count)}
  result
end

def string_to_signed_integer(str)
  if str[0] == '-' || '+'
    sign = str[0]
    str.delete!('+-')
  end
  result = string_to_integer(str)
  sign == '-' ? -result : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100