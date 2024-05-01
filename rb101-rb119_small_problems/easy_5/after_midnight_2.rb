=begin

PROBLEM
2 methods, each taking string in 24-hour format and returning a value in the range 0..1439 reflecting the number of minutes before and after midnight respectively.

EXAMPLES
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0


DATA



ALGORYTHM



CODE
=end

def after_midnight(str)
  result = 0
  if str == '00:00' || str == '24:00'
  else
    result += str[0].to_i*600
    result += str[1].to_i*60
    result += str[3].to_i*10
    result += str[4].to_i
  end
  result
end

def before_midnight(str)
  result = 0
  if str == '00:00' || str == '24:00'
  else
    result = 1440 - after_midnight(str)
  end
  result
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0