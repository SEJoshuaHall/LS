class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 1 
    divisors = get_divisors(int)
    comparitor = divisors.inject(:+)
    if int > comparitor
      return 'deficient'
    elsif int < comparitor
      return 'abundant'
    else
      return 'perfect'
    end
  end

  def self.get_divisors(int)
    divisors = []
    (1..int-1).each do |num|
      divisors << num if int % num == 0
    end
    divisors
  end
end