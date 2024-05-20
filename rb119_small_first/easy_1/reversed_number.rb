def reversed_number(int)
  int_rev = ''
  int = int.to_s.chars
  until int.empty?
    int_rev << int.pop
  end
  int = int_rev.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1