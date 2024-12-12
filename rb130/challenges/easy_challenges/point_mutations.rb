class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparitor)
    idx = 0
    distance = 0
    loop do
      distance += 1 if @strand[idx] != comparitor[idx]
      idx += 1
      break if idx >= comparitor.length || idx >= @strand.length
    end
    distance
  end

end