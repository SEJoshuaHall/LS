=begin

1.
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end
  
  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

#This will return 'You will ' + one of the choices.

2.
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end
  
  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
puts trip.predict_the_future

#We are going to get the RoadTrip choices.

3.
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
#Ruby will follow the lookup chain, first within the method, then the modules starting from the end, then the parent, then it's modules starting from the end, etc. We can use the `#.ancestors` method. ancestors is a class method!!!

4.
class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end
  
  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

5.
excited_dog = "excited dog" #local variable, no @
@excited_dog = "excited dog" #instance variable, 1 @
@@excited_dog = "excited dog" #class variable, 2 @


6.
class Television
  def self.manufacturer #class method
    # method logic
  end
  
  def model
    # method logic
  end
end

#class methods are defined with self.class. You would call it on the class, not an instance of the class. IE Television.manufacturer

7.
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

Cat.new('grey')
p Cat.cats_count

# @@cats_count is a class variable. It is tied to the class, not the instances of the class. Each time an instance of the Cat class is instantiated, initialize increments it.

8.
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

9.
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

#If we add a play method to Bingo, it will override the Play method from Game.

10.
Benefits to using OOP:
- encapsulation allows us to isolate code so that it has no unwanted effects on other parts of the program and vice versa. It also allows for greater complexity. Only exposing behavior and state necessary reduces conflicts in the codebase and simplifies development.
- it reduces duplication, helping us to dry up our code.
=end

