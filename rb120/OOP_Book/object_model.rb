#Create an object

#First, define a class:

class MyClass
  include Bark
end

#Instantiate an object with .new:

my_obj = MyClass.new

#Instantiating other objects from other classes:

str = String.new
arr = Array.new
hsh = Hash.new

p str
p hsh
p arr

module Bark
  class Dog
  end

  class Tree
  end
end

first_sound = Bark::Dog.new