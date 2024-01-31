require 'json'
a = 16
test_array = ["Give quiche a chance", "Mutants out!", "Chameleonic Life-Forms!", ['test', 'subject'], 99, a]

test_string = test_array.to_json

filename = "Rimmer.txt"

File.open(filename, "w") do |f|
  f.write(test_string)
end

read_string = File.read(filename)

read_array = JSON.parse(read_string)

puts(read_string == test_string)
puts(read_array == test_array)
