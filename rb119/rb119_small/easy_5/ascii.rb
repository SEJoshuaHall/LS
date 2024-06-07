def ascii_value(str)
  result = 0
  str.chars.each {|char| result += char.ord}
  result
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
