class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, description)
    super(name, age)
    @description = description
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@description} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
=end