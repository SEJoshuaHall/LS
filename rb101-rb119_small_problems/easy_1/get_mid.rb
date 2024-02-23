def center_of(str)
  str = str.chars
  if str.length.even?
    return str[(str.length/2)-1] + str[(str.length/2)]
  else 
    return str[(str.length/2)]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
