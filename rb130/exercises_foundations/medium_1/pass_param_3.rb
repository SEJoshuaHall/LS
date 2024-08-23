items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do | *list1, list2 |
#   puts list1.join(', ')
#   puts list2
# end

# gather(items) do | list1, *list2, list3 |
#   puts list1
#   puts list2.join(', ')
#   puts list3
# end

# gather(items) do | list1, *list2 |
#   puts list1
#   puts list2.join(', ')
# end

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, and #{d}"
end