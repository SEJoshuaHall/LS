class RomanNumerals
  def self.from_roman(str)
    result = 0
    result += self.thousand(str)
    result += self.hundred(str)
    result += self.ten(str)
    result += self.one(str)
    result
  end

  def self.to_roman(int)
    result = ""
    result << self.thousands(int)
    result << self.hundreds(int)
    result << self.tens(int)
    result << self.ones(int)
    result
  end

  def self.thousands(int)
    
  end

  def self.hundreds(int)
    
  end

  def self.tens(int)
  end


  def self.ones(int)
    
  end

  def self.thousand(str)
    
  end

  def self.hundred(str)
    
  end

  def self.ten(str)
    
  end


  def self.one(str)
    
  end
end