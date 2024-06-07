def substrings(str)
  result = []
  str.chars.each_index do |start_idx|
    start_idx.upto(str.length - 1) do |end_idx|
      result << str[start_idx..end_idx]
    end
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]