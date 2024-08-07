def crunch(str)
  result = ''
  str.chars.each_with_index do |letter, index|
    if index > 0 && str[index - 1] != letter
      result << letter
    elsif index == 0
      result << letter
    end
  end
  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''