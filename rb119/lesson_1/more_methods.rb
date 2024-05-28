=begin

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end


hsh = { a: "ant", b: "bear", c: "cat" }

hsh.each_with_index do |(k, v), i|
  puts "The key is #{k}!"
  puts "The value is #{v}!"
  puts "The index is #{i}!"
  puts
end


arr = [1, 2, 3]
empty = []
p arr

arr.each_with_object(empty) do |num, array|
  array << num if num.odd?
end

p empty



hsh = { a: "ant", b: "bear", c: "cat" }
arr = []

hsh.each_with_object(arr) do |pair, array|
  if pair.key?(:a)
    array << pair
  end
end

p arr



=end


