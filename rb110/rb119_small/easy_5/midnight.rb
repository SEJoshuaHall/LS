def time_of_day(int)
  before_mindnight = false
  if int < 0
    before_midnight = true
    int = int * -1
  end
  hours, minutes = int.divmod(60)
  hours = hours % 24
  if before_midnight
    hours = 23 - hours
    minutes = 60 - minutes
  end
  time = "#{sprintf('%02d', hours)}:#{sprintf('%02d', minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"