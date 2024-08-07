=begin

PROBLEM
Take an integer year as an input and return true or false based on whether it represents a leap year.
True if evenly divisible by 4
Unless also divisible by 100 - then false
unless also divisible by 400 - then true
May assume greater than 0

EXAMPLES
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true


DATA
Input is an integer
Output is a boolean


ALGORYTHM
if num modulo 400 == 0, true
elsif num modulo 100 == 0, false
elsif num modulo 4 == 0, true
else false


CODE
=end

def leap_year?(int)
  if int % 400 == 0
    return true
  elsif int % 100 == 0
    return false
  elsif int % 4 == 0
    return true
  else
    return false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true