=begin
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:

Copy Code
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
=end

=begin
PROBLEM
Take a year and convert it to it's century with the appropriate two letter ending.

Input: integer
Output: string

Questions:
- Assume only take positive, non-zero integers?

Rules:
- Must end in appropriate 2 letter descriptor
- years ending 00 go with previous century
- single or double digit years belong to 1st century

EXAMPLES
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

DATA
strings

ALGORITHM
Method 
- assign integer to int
- If int < 101, return 1st
- subtract 1
- remove last 2 digits
- add 1
- case
  - end 1* append 'th'
  - end 2 'nd'
  - end 3 'rd'
  - else 'th'

CODE
=end

def century(int)
  return '1st' if int < 101
  int -= 1
  int = int.to_s[0..-3].to_i
  int += 1
  return "#{int}th" if int.to_s[-2] == '1'
  ending(int)
end

def ending(int)
  case int.to_s[-1]
  when '1' then "#{int}st"
  when '2' then "#{int}nd"
  when '3' then "#{int}rd"
  else "#{int}th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'