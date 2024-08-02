=begin
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!


######################

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"

###########################

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

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

################
module TurboChargable
  def turbo?(cost)
    cost > 8000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  @@total_vehicles = 0

  def self.miles_per_gallon(gallons_used, miles_driven)
    mpg = miles_driven / gallons_used
    puts "This car gets #{mpg} miles to a gallon of gas!"
  end

  def self.num_vehicles
    "You have #{@@total_vehicles} vehicles!"
  end

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@total_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint
    puts "What color would you like to paint your car?"
    @color = gets.chomp
    puts "The color of your car is now #{@color}!"
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def get_age
    puts "This vehicle is #{self.age} years old!"
  end

  private

  def age
    date = Time.new
    @age = date.year - @year
  end
end

class MyCar < Vehicle
  TRUNK = true

  def to_s
    "This car is a #{self.color} #{self.year} #{@model}!"
  end
end

class MyTruck < Vehicle
  include TurboChargable
  BEDSIZE = 5.6
  
  def to_s
    "This truck is a #{self.color} #{self.year} #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed
lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint
MyCar.miles_per_gallon(10, 200)
puts lumina
Vehicle.num_vehicles
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
lumina.get_age

=end

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

bob = Student.new("Bob", 90)
joe = Student.new("Joe", 97)
puts "Well done!" if joe.better_grade_than?(bob)