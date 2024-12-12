def my_method(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
raptors = []

my_method(birds) do |elements| 
  first, second, *remaining = elements
  raptors << remaining
end

puts raptors