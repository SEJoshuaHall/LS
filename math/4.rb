results = []

900.upto(999) do |n1|
  900.upto(999) do |n2|
    if n1 * n2 == (n1 * n2).to_s.reverse.to_i
      results << [n1, n2, (n1 * n2)]
    end
  end
end

p results.max[2]
