def swapcase(str)
  cases = ((("A".."Z").to_a).zip(("a".."z").to_a)).to_h
  result = str.chars.map do |char|
    if cases.keys.include?(char)
      char = cases[char]
    elsif cases.values.include?(char)
      char = cases.key(char)
    end
    char
  end
  result.join("")
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'