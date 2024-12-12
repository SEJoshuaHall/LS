items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *first_set, last |
  puts first_set.join(', ')
  puts last
end

puts

gather(items) do | first, *middle, last |
  puts first
  puts middle.join(', ')
  puts last
end

puts

gather(items) do | first, *last_set |
  puts first
  puts last_set.join(', ')
end

puts

gather(items) do | a, b, c, d |
  puts "#{a}, #{b}, #{c}, and #{d}"
end

