class Pets
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Pets
  def speak
    'Meow!'
  end
end

class Dog < Pets
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

billy = Bulldog.new
puts billy.speak           # => "bark!"
puts billy.swim           # => "swimming!"

tom = Cat.new
puts tom.speak
puts tom.run

p Bulldog.ancestors
=begin
Bulldog -> Dog -> Pets -> Object -> Kernel -> BasicObjects
           Cat /     

=end