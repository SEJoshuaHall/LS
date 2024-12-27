require 'date'

# Set your target weekday (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
weekday = 1  # Monday

# Set your target year and month
year = 2024
month = 12

# Get all dates in the month
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)  # -1 gets the last day of the month

# Find all matching weekdays
matching_days = (first_day..last_day).select do |date|
  date.wday == weekday
end

# Print results
matching_days.each do |date|
  puts date.strftime("%A, %B %d, %Y")
end

