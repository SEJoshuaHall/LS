class SumOfMultiples
  def initialize(*args)
    @arr = args.to_a
    if @arr.empty?
      @arr = [3, 5]
    end
  end

  def to(int)
    result = 0
    0.upto(int-1) do |num|
      result += num if @arr.any? {|int| num % int == 0}
    end
    result
  end

  def self.to(int)
    result = 0
    0.upto(int-1) do |num|
      result += num if num % 3 == 0 || num % 5 == 0
    end
    result
  end
end
