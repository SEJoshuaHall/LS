5.times do |num|
  puts num
end

def times(int)
  counter =0
  while counter < int do
    yield(counter)
    counter += 1
  end

  int
end

times(5) do |num|
  puts num
end

