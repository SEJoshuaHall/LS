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
end

my_car = Car.new
my_car.start