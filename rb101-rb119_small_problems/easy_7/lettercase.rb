=begin

PROBLEM
take string, return hash with 3 entries: number lowercase, number uppercase, number neither.


EXAMPLES
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


DATA
create empty string
add hashes with each data type and corresponding count


ALGORYTHM



CODE
=end
def letter_case_count(string)
  result = {}
  result[:lowercase] = string.count 'a-z'
  result[:uppercase] = string.count 'A-Z'
  result[:neither] = string.count '^A-Za-z'
  result
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }