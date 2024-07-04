class Cat
  COLOR = 'purple'
  @@total = 0
  def initialize(name)
    @name = name
    @@total += 1
  end

  def self.total
    @@total
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# Hello! My name is Sophie and I'm a purple cat!