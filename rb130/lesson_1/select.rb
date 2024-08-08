def select(array)
  counter = 0
  result = []
  
  while counter < array.length
    include = yield(array[counter])
    result << array[counter] if include
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }