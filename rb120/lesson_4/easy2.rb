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

  def self.count
    @@cats_count
  end
end

p Cat.count
Cat.new('blue')
p Cat.count