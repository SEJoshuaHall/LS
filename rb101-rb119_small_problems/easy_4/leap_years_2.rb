def gregorian?(int)
  if int % 400 == 0
    return true
  elsif int % 100 == 0
    return false
  elsif int % 4 == 0
    return true
  else
    return false
  end
end

def julian?(int)
  int % 4 == 0
end

def leap_year?(int)
  if int < 1752
    julian?(int)
  else
    gregorian?(int)
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true