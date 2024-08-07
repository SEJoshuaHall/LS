def greetings(name_arr, about_hsh)
  puts "Hello, #{name_arr[0]} #{name_arr[1]} #{name_arr[2]}! Nice to have a #{about_hsh[:title]} #{about_hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."