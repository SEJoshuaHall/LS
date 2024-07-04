class Cat
  attr_reader :name, :color
  COLOR = "purple"

  def initialize(name)
    @name = name
  end

  def greet
    "Hello, my name is #{name}, and I am a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
p kitty.greet