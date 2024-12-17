=begin
1. All, by calling #.class

2.
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast


3.
By calling self.class from the Car object, we are in effect calling Car.class.

4.
AngryCat.new

5.
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

Instance varialbes begin with '@', and only the Pizza class instantiates an instance variable (@name). We can call `#.instance_variables` on an instantiated object of a class to confirm.

6.
Object#to_s, which returns the name of the object's class and an encoding of the object ID. We can look at the Object class in the RubyDocs.

7.
class Cat
  attr_accessor :type, :age
  
  def initialize(type)
    @type = type
    @age  = 0
  end
  
  def make_one_year_older
    self.age += 1
  end
end

self refers to the Cat instance object calling the method.

8.
class Cat
  @@cats_count = 0
  
  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end
  
  def self.cats_count
    @@cats_count
  end
end

Here self refers to the class. This is a class method, not an instance method.

9.
=end
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('blue', 'demin')