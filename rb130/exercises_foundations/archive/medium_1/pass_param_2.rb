birds = %w(raven finch hawk eagle)

def method(array)
  yield array
end

method(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end