def repeater(str)
  result = ''
  str.chars.each do |char|
    result << char + char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''