=begin
 # 1
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name

# The output will be nil. Instance variables which have not been initialized return nil.

# 2
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable
  
  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim

# The output will be nil. Since the instance variable has not been initialized, it returns nil, which is falsy. So swim will do nothing but return nil (last evaluated expression) which `p` will output to the screen.


module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 


# 4
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name, animals=[])
    @name = name
    @animals = animals
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    [AnimalClass.new(name, animals), AnimalClass.new(other_class.name, other_class.animals)]
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes

# 5
class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end
  
  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
# Because Ruby thinks change_info is trying to create new local variables. We need self.(variable) to use the attr_accessor methods.


# 6
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name

# We raise an error because `name.upcase` has not been initialized. It is expecting a local variable. We need to call self.name = self.name.upcase` or `self.name.upcase!`

# 7
class Vehicle
  @@wheels = 4
  
  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels
# 4 followed by 5 2s, class variables are shared with every instance of the class and it's children, and when modified, modify for every instance of the class and it's children.

# 8
class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno

# Dog object with name and color instance variables set to 'brown'. Demonstrates that super takes all arguments passed in to the parent method by default.

# 9
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
# color gets passed into super, which cannot accept an argument, causing it to throw an error. Need to call super().

# 10
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable
  
  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable
  
  class GoodDog < Animal
    include Swimmable
    include Danceable
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
# Since GoodDog inherits from Animal, and Animal includes Walkable, the method can be accessed.
=end


card_values = {'Jack' => 11, 'Queen' => 12,  'King' => 13}
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

# {'Jack of Spades' => ['Jack', 11]}

cards = {}

card_values.each_pair do |k, v|
  suits.each do |s|
    cards["#{s} of #{k}"] = [k, v]
  end
end

p cards