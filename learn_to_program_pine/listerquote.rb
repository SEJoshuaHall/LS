filename = "listerquote.txt"
test_string = "I promise..."

File.open(filename, "w") do |f|
  f.write(test_string)
end

read_string = File.read(filename)

puts(read_string == test_string)
puts read_string