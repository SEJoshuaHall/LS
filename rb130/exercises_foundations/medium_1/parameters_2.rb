birds = %w(raven finch hawk eagle)

def my_method(array)
  yield(array)
end

raptors = nil

my_method(birds) { |birds| _, _, *raptors = birds }

p raptors