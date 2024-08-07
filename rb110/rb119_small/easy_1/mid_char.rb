def center_of(str)
  length = str.length
  if length.odd?
    str[(length-1)/2]
  else
    str[((length/2)-1), 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'