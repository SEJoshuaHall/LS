=begin

PROBLEM
take an integer and find the next larger integer which is a multiple of 7, is odd, and does not have repeating digits (cannot exceed 10 digits)


EXAMPLES
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


DATA



ALGORYTHM



CODE
=end
def unique_digits(integer)
  result = true
  count = {}
  length = integer.to_s.length
  integer.to_s.chars.each do |char|
    if count[char]
      result = false
    else count[char] = 1
    end
  end
  result
end

def featured(integer)
  comparator = 7
  loop do
    if comparator > integer && unique_digits(comparator)
      return comparator
    end
    comparator += 14
    if integer > 999999999
      comparator = 'There is no possible number that fulfills those requirements.'
      break
    end
  end
  comparator
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999999) == 1023547
p featured(999999987) == 1023456987

p featured(9999999999) == 'There is no possible number that fulfills those requirements.'