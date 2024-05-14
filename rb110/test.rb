

# Iterate through the array to find all possible slices

  (0...arr.length - 2).each do |start|
  ((start + 3)..arr.length).each do |end_point|
    slice = arr[start...end_point]
    result.push(slice) if is_fibonacci(slice)
    end
  end