def after_midnight(time_str)
  return 0 if time_str == '00:00' || time_str == '24:00'
  hours = time_str.slice(0, 2).to_i
  minutes = time_str.slice(3, 2).to_i
  result = (hours * 60) + minutes
end

def before_midnight(time_str)
  return 0 if time_str == '00:00' || time_str == '24:00'
  hours = time_str.slice(0, 2).to_i
  minutes = time_str.slice(3, 2).to_i
  result = ((23 - hours) * 60) + (60 - minutes)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0