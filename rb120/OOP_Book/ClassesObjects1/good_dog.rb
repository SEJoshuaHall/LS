class GoodDog
  attr_accessor :name, :height, :weight
  # attr_writer :name
  # attr_reader :name

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  
  def speak
    "#{self.name} says Arf!"
  end
  
  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

    # def name
    #   @name
    # end
  
    # def name=(name)
    #   @name = name
    # end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info