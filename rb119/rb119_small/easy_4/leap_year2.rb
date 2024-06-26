def leap_year_greg?(int)
  int % 400 == 0 || int % 4 == 0 && int % 100 != 0
end

def leap_year?(year)
  year > 1751 ? leap_year_greg?(year) : year % 4 == 0
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