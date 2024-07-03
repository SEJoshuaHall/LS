class Engine
  def start
    puts "Engione starting..."
  end
end

class Car
  def initialize
    @engine = Engine.new
  end

  def start
    @engine.start
  end

  def self.gas_mileage(m, g)
    puts "#{m/g} miles per gallon of gas."
  end

  def to_s
    "This is a car."
  end
end

my_car = Car.new
my_car.start
puts my_car