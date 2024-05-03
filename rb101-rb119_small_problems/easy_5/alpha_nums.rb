=begin

PROBLEM
Take array of integers between 0 and 19 and sort based on the English words for each number.


EXAMPLES
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


DATA
Input: array
array to hold names of numbers
Output: array


ALGORYTHM
Create array for names of numbers
sort numbers based on the order of their names
return


CODE
=end

NAME_OF_NUMBERS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort { |num1, num2| NAME_OF_NUMBERS[num1] <=> NAME_OF_NUMBERS[num2] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]
