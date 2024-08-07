module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

module Walkable
  def walk
    puts "Walking"
  end
end

class GoodDog
  include Speak
  include Walkable
end

class HumanBeing
  include Speak
  include Walkable
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")

puts ''
puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors