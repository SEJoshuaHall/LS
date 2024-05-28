=begin

PROBLEM
return list of all substrings which are palindromic. Case sensitive, and symbol sensitive. Maintain original sequence


EXAMPLES
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]


DATA



ALGORYTHM



CODE
=end
def leading_substrings(str)
  counter = 1
  result = []
  until counter == str.length+1
    result << str.slice(0, counter)
    counter += 1
  end
  result
end

def substrings(str)
  result = []
  counter = 0
  until counter == str.length+1
    result << leading_substrings(str.slice(counter..-1))
    counter += 1
  end
  result.flatten
end

def palindromes(str)
  working_subs = substrings(str)
  result = []
  working_subs.each do |sub|
    if sub == sub.reverse && sub.length >= 2
      result << sub
    else
      next
    end
  end
  result
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == ['ll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada', 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did', '-madam-', 'madam', 'ada', 'oo']
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']