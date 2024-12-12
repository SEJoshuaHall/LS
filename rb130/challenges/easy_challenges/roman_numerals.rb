class RomanNumeral
  def initialize(int)
    @int = int
  end

  def to_roman
    result = ''
    nums = @int.to_s.chars.map { |x| x.to_i }.reverse

    if nums[0] < 4 && nums[0] > 0 then result = ('I' * nums[0]) + result
    elsif nums[0] == 4 then result = ('IV') + result
    elsif nums[0] == 5 then result = ('V') + result
    elsif nums[0] > 5 && nums[0] < 9 then result = 'V' + ('I' * (nums[0] - 5)) + result
    elsif nums[0] == 9 then result = ('IX') + result
    end
    return result unless nums.count > 1

    if nums[1] < 4 && nums[1] > 0 then result = ('X' * nums[1]) + result
    elsif nums[1] == 4 then result = ('XL') + result
    elsif nums[1] == 5 then result = ('L') + result
    elsif nums[1] > 5 && nums[1] < 9 then result = 'L' + ('X' * (nums[1] - 5)) + result
    elsif nums[1] == 9 then result = ('XC') + result
    end
    return result unless nums.count > 2

    if nums[2] < 4 && nums[2] > 0 then result = ('C' * nums[2]) + result
    elsif nums[2] == 4 then result = ('CD') + result
    elsif nums[2] == 5 then result = ('D') + result
    elsif nums[2] > 5 && nums[2] < 9 then result = 'D' + ('C' * (nums[2] - 5)) + result
    elsif nums[2] == 9 then result = ('CM') + result
    end
    return result unless nums.count > 3

    if nums[3] < 4 && nums[3] > 0 then result = ('M' * nums[3]) + result end

    result
  end
end
