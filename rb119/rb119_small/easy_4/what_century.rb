=begin

PROBLEM
Take an integer representing a year, and return the p century as a string

ALGORITHM
add 99
divide by 100 and round down
append suffix
  4-20th
  1st
  2nd
  3rd
  4-20th

=end

def century(year)
  century = (((year + 99) / 100).floor).to_s
  century_marker = (century % 100).to_i
  century << 'st' if century_marker % 100 == 1  || century_marker % 100 > 20 && century_marker % 10 == 1
  century << 'nd' if century_marker % 100 == 2 || century_marker % 100 > 20 && century_marker % 10 == 2
  century << 'rd' if century_marker % 100 == 3 || century_marker % 100 > 20 && century_marker % 10 == 3 
  century << 'th' if century_marker % 100 > 3 && century_marker % 100 < 21 || century_marker % 10 > 3
  century
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