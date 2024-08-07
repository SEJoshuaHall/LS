def leading_substrings(str)
  counter = 1
  result = []
  1.upto(str.length) do |size|
    result << str.slice(0, size)
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']