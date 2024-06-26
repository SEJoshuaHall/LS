def sequence(int)
  result = []
  1.upto(int) do |count|
    result << count
  end
  result
end

# def sequence(int)
#   (1..int).to_a
# end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]