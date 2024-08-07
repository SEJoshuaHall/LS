class MyClass
  def initialize(name)
    @name = name
  end
end

my_class = MyClass.new('Joshua')

###### COMPOSITION ############

class Engine
  def start
    puts "Engine starting..."
  end
end

class Car
  def initialize
    @engine = Engine.new #creates engine instance when car is created
  end

  def start
    @engine.start
  end
end

my_car = Car.new
my_car.start #Engine is an integral part of car

###### Aggregation #############

class Passenger
end

class Car
  def initialize(passengers)
    @passengers = passengers # Passengers are given to the car at cretion
  end
end

# Passengers can exist without Car
passengers = [Passenger.new, Passenger.new]
my_car = Car.new(passengers)

####### Giving Behaviors #########

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = name
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def some_method
    self.info
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

#################################################################################

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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
end

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