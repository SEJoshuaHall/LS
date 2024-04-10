=begin
Solved Using PEDAC

### Problem:
"Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number. New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century."

Input: integer for year
Output: string representing century

Requirements:
  - determine century and convert to representation of that century (2 methods)
  - use appropriate ending for century
  - centuries begin with year with *01 and are named for the *+1 (eg 1901 begins 20th century)

Questions:
  - Can I assume that input years will be positive, non-zero numbers? (For this solution I will)

Mental Model:
  - Convert year input as integer to it's corresponding century name and return as a string. The challenge will be assigning the appropriate ending (st, nd, rd, or th).

### Examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

### Data:
  - Input: integer
  - hash to store century endings (values) by their corresponding thousandth and hundredth places (keys)
  - variable for the converted century
  - string with final return value

### Algorithm:

build first method `century` to convert year to corresponding century, calls helper method `century_ending` to determine and concat appropriate ending
  - takes an integer and assigns to parameter `year`
  - takes all but last 2 digits and adds 1 to find the century number
  - calls `century_ending` to find appropriate ending
  - returns century number and ending
build helper method `century_ending`
  - build Hash to store century key/values
    - example {1 => 'st'}
  - takes century_number as argument
  - looks up value in hash by key
  - returns corresponding value

### Code:
=end




def century(year)
  if year < 100
    result = '1st'
  elsif year % 100 == 0
    century = year.digits.reverse
    century.pop
    century.pop
    century = century.join.to_i
    century_str = century.to_s
    result = century_str + century_ending(century) 
  else
    century = year.digits.reverse
    century.pop
    century.pop
    century = century.join.to_i
    century += 1
    century_str = century.to_s
    result = century_str + century_ending(century)
  end
end

def century_ending(century_number)
  century_endings = {1 => 'st', 21 => 'st', 31 => 'st', 41 => 'st', 51 => 'st', 61 => 'st', 71 => 'st', 81 => 'st', 91 => 'st',
                     2 => 'nd', 22 => 'nd', 32 => 'nd', 42 => 'nd', 52 => 'nd', 62 => 'nd', 72 => 'nd', 82 => 'nd', 92 => 'nd',
                     3 => 'rd', 23 => 'rd', 33 => 'rd', 43 => 'rd', 53 => 'rd', 63 => 'rd', 73 => 'rd', 83 => 'rd', 93 => 'rd'}
  if century_number > 99
    century_number -= century_number.round(-2)
    if century_number < 0
      century_number += 100
    end
    if century_endings.include?(century_number)
      ending = century_endings.fetch(century_number)
    else 
      ending = 'th' 
    end
  elsif century_endings.include?(century_number)
    ending = century_endings.fetch(century_number)
  else 
    ending = 'th' 
  end
end


p century(2000) == '20th' # => true
p century(2001) == '21st' # => true
p century(1965) == '20th' # => true
p century(256) == '3rd' # => true
p century(5) == '1st' # => true
p century(10103) == '102nd' # => true
p century(1052) == '11th' # => true
p century(1127) == '12th' # => true
p century(11201) == '113th' # => true

p century(1127) == '12th' # => true
p century(11201) == '113th' # => true

p century(112227) #== '1123rd' # => true
p century(112001) #== '1121st' # => true