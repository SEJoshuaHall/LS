class Triangle
  attr_reader :kind, :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    determine_valid
    determine_kind
  end

  def determine_valid
    raise ArgumentError, "Invalid triangle: Sum of two smaller sides must be greater than the largest side"  if @sides[2] >= (@sides[1] + @sides[0])
    raise ArgumentError, "Invalid triangle: Sides must be positive numbers" unless @sides.all? { |side| side > 0 }
  end

  def determine_kind
    case @sides.uniq.count
    when 3 then @kind = 'scalene'
    when 2 then @kind = 'isosceles'
    when 1 then @kind = 'equilateral'
    end
  end
end
