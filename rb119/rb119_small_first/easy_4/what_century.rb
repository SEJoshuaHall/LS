=begin

PROBLEM
Write a method which takes a year as input and returns a string containing the century with it's appropriate ending. Centuries begin with 01.
Assume no negative entries.

EXAMPLES
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

1st
2nd
3rd
4th
5th
6th
7th
8th
9th
10th
11th
12th
13th
14th
15th
16th
17th
18th
19th
20th
21st
22dn
23rd
24th
25th
26th
27th
28th
29th

DATA
Input: integer
Output: string


ALGORYTHM
assign century_num to:
if ends in 0, cut off last 2 digits and subtract 1 from result
else cut off last 2 digits

determine and append ending:
if 1*, 'th'
elsif 1, 'st'
elsif 2, 'nd'
elsif 3, 'rd'
else 'th'

return resulting string

CODE
=end

def century(int)
  cent_num = int > 100 ? ((int+99)/100) : 1
  if (cent_num/10)%10 == 1
    "#{cent_num}th"
  elsif cent_num%10 == 1
    "#{cent_num}st"
  elsif cent_num%10 == 2
    "#{cent_num}nd"
  elsif cent_num%10 == 3
    "#{cent_num}rd"
  else
    "#{cent_num}th"
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