=begin
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

toyota = Car.new
toyota.go_fast

=end
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

cat = AngryCat.new