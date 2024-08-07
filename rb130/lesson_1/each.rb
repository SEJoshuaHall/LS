# p [1, 2, 3].each{|num| "do nothing"}.select{|num| num.odd?}

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

p each([1, 2, 3]) { |number| puts number }.select{ |num| num.odd? }
