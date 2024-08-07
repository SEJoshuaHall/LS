

#using a counter
def triangle(int)
  counter = 1
  int.times do
    puts (' ' * (int - counter)) + ('*' * counter)
    counter += 1
  end
end

#upto/downto
def triangle(int)
  1.upto(int) { |num| puts (' ' * (int - num)) + ('*' * num) }
end

#rjust
def triangle(int)
  1.upto(int) { |num| puts ('*'*num).rjust(int) }
end


triangle(5)
triangle(9)