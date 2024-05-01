=begin

PROBLEM
Convert a number to it's 24 hour representation starting at midnight and moving forward if positive and backword in negative.

EXAMPLES
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"


DATA
Input: integer
Output: string containing two 2-digit numbers with a ':' in between


ALGORYTHM
determine if positive or negative
take the remainder when dividing the integer by 1440 (minutes per day)
if negative, get difference of result and 1440
take result and get the number and remainder when dividing by 60 (minutes per hour)
string equals hours : minutes

CODE
=end

def time_of_day(int)
  sign = ''
  if int < 0
    sign = '-'
    int *= -1
  end
  int = int % 1440
  if sign == '-'
    int = 1440 - int
  end
  hour_min = int.divmod(60)
  "#{hour_min[0].to_s.rjust(2, '0')}:#{hour_min[1].to_s.rjust(2, '0')}"
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# def get_time(int)
#   t = Time.new(2024, 4, 28, 0 , 0, 0)
#   seconds = int * 60
#   if int == 0
#     result = t
#   elsif int < 0
#     result = t - int
#   else
#     result = t + int
#   end
#   "#{result.hour.to_s.rjust(2, '0')}:#{result.min.to_s.rjust(2, '0')}"
# end

# p get_time(0)
# p get_time(-3)
# p get_time(35)
# p get_time(-1437)
# p get_time(3000)
# p get_time(800)
# p get_time(-4321)

# def get_day_time(int)
#   t = Time.new(2024, 4, 28, 0 , 0, 0)
#   seconds = int * 60
#   if int == 0
#     result = t
#   elsif int < 0
#     result = t - int
#   else
#     result = t + int
#   end
#   time_hsh = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5=> "Friday", 6 => "Saturday"}
#   "#{time_hsh[result.wday]} #{result.hour.to_s.rjust(2, '0')}:#{result.min.to_s.rjust(2, '0')}"
# end

# p get_day_time(0)
# p get_day_time(-3)
# p get_day_time(35)
# p get_day_time(-1437)
# p get_day_time(3000)
# p get_day_time(800)
# p get_day_time(-4321)

