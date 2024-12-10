def reduce(array, acc=nil)
  acc ? counter = 0 : counter = 1
  acc ? result = acc : result = array[0]
  
  while counter < array.count do
    result = yield(result, array[counter])
    counter += 1
  end

  result
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']