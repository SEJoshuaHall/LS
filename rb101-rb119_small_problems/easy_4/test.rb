def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end


p century(2000) == '20th' # => true
p century(2001) == '21st' # => true
p century(1965) == '20th' # => true
p century(256) == '3rd' # => true
p century(5) == '1st' # => true
p century(10103) == '102nd' # => true
p century(1052) == '11th' # => true
p century(1127) == '12th' # => true
p century(11201) #== '113th' # => true

p century(112227) #== '1123rd' # => true
p century(112001) #== '1121st' # => true