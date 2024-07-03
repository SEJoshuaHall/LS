class GoodDog
  @@number_of_dogs = 0
  DOG_YEARS = 7

  attr_accessor :name,  :age

  def initialize(n, a)
    @@number_of_dogs += 1
    @name = n
    self.age = a * DOG_YEARS
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def change_info(n)
    self.name = n
  end
  
  def speak
    "#{self.name} says Arf!"
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."    
  end

end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age
puts sparky.name
puts sparky
p sparky