module Vacationable
  def vacation
    puts "Taking a vacation."
  end
end


class Vehicle
  @@total_vehicles = 0
  def initialize
    @engine = Engine.new
    @@total_vehicles += 1
  end
  
  def self.get_total_vehicles
    puts "There are #{@@total_vehicles} vehicles in your fleet."
  end

  def self.gas_mileage(m, g)
    puts "#{m/g} miles per gallon of gas."
  end

  def start
    @engine.start
  end
  
end

class Engine
  def start
    puts "Engine starting..."
  end
end

class Car < Vehicle
  include Vacationable
  CAR = "4 door"

  def to_s
    "This is a car."
  end
end

class Truck < Vehicle
  TRUCK = "2 door"

  def to_s
    "This is a truck."
  end
end

my_car = Car.new
my_car.start
puts Vehicle.ancestors
puts Car.ancestors
