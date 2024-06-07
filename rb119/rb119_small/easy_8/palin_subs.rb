def substrings(str)
  result = []
  str.chars.each_index do |start_idx|
    start_idx.upto(str.length - 1) do |end_idx|
      result << str[start_idx..end_idx]
    end
  end
  result
end

def palindromes(str)
  result = []
  all_subs = substrings(str)
  all_subs.each { |sub| result << sub if sub == sub.reverse && sub.length > 1 }
  result
end

  #Selects all substrings without regard for case or non-alphanumeric symbols. This may have unexpected consequences.
# def palindromes(str)
#   result = []
#   all_subs = substrings(str)
#   all_subs.each { |sub| result << sub if sub.downcase.gsub(/\W/, '') == sub.downcase.gsub(/\W/, '').reverse && sub.length > 1 }
#   result
# end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]