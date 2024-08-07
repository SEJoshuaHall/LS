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

p substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]