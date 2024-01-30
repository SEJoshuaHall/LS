
year = 1930 + rand(21)

loop do
  puts "What will you tell Grandma?"
  tell = gets.chomp
  
  if tell != tell.upcase
    puts "HUH?! SPEAK UP, SONNY!"
  elsif tell == "BYE BYE BYE"
    break
  elsif tell == tell.upcase
    puts "NO, NOT SINCE #{year}"
  end 
end
