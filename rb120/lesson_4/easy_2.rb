=begin
Question 1
You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

it will randomly return one of the choices from the choices method array

Question 2
We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

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

What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

Since we are calling the method on an instance of RoadTrip, Ruby will choose from the RoadTrip choices method.

Question 3
How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

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

What is the lookup chain for Orange and HotSauce?

Ruby looks in the lookup chain. You can call ancestors on an object to find its lookup chain. Orange, Taste, Object, Kernel, Basic Object; HotSauce, Taste, Object, Kernel, Basic Object

Question 4
What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

set attr_accessor :type

Question 5
There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

the @ symbols determine the type of variable: local, @instance, @@class

Question 6
If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Which one of these is a class method (if any) and how do you know? How would you call a class method?

self.manufacturer, class methods are defined beginning with self. Call a class method as follows: Class.method

Question 7
If we have a class such as the one below:

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
Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

@@cats_count is a class variable. It is initialized the first time a Cat object is created. For each Cat object that is instantiated, the initialize method adds 1 to the class variable. Calling Cat.cats_count will return the current value which represents the number of Cat objects instantiated. We just need to instantiate some Cat objects and call the Cat.cats_count method.

Question 8
If we have this class:

class Game
  def play
    "Start the game!"
  end
end
And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Bingo < Game

Question 9
If we have this class:

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

What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

The new method would override the old one.

Question 10
What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.
1. Encapsulation protects data and methods
2. Ancapsulation enables modifications to segments of code without affecting the rest of the codebase, so long as the public interfaces do not change, or the changes to the public interfaces are implemented in the other parts of the code which use it.

=end