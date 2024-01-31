puts "What year were you born?"
year = gets.chomp.to_i
puts "What month were you born?"
month = gets.chomp.to_i
puts "What day were you born?"
day = gets.chomp.to_i

bday = Time.utc(year, month, day)
today = Time.new 
age = today - bday
years = age.to_i/31536000
puts "You are #{years} old!"
until years == 0
  print ":)"
  years-=1
end
puts
