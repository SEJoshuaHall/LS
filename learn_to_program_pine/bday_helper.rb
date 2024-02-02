require 'json'
bday_read = File.read("birthdays.txt")
bday_arr = JSON.parse(bday_read)

puts bday_arr
p bday_arr