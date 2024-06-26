=begin
PROBLEM
take str, return number of distinct chars occuring more than 1x

EXAMPLES
DATA
input str
output int

ALG
set unique to str chars uniq
set result = 0
iterate over unique
  count occurances and if more than 1, increment result
return result
=end

def distinct_multiples(str)
  unique = str.chars.uniq
  result = 0
  unique.each do |char|
    if str.downcase.count(char) > 1
      result += 1
    end
  end
  result
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5