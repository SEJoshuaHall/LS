=begin

PROBLEM
take year as integer, return number of 13th in that year which are a Friday


EXAMPLES
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2


DATA



ALGORYTHM



CODE
=end

def friday_13th(year)
  month = 1
  unlucky_days = 0
  12.times do
    t = Time.new(year, month, 13)
    if t.friday? 
      unlucky_days += 1
    end
    month += 1
  end
  unlucky_days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2