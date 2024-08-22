def step(first, last, step)
  counter = first
  result = []
  until counter > last do
    result << yield(counter)
    counter += step
  end
  result
end

step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10