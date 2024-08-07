require 'Date'
def friday_13th(year)
  count, month, date = 0, 0, Date.new(year, 1, 13)
  12.times do
    count += 1 if (date >> month).friday?
    month += 1
  end
  count
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2