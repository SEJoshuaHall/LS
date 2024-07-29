=begin
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'


class Person
  attr_accessor :first_name, :last_name
  
  def initialize(first_name, last_name=(''))
    @first_name = first_name
    @last_name = last_name
  end
  
  def name
    "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

=end
class Person
  attr_reader :first_name, :last_name
  
  def initialize(first_name, last_name=(''))
    @first_name = first_name
    @last_name = last_name
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def name=(name)
    @first_name = name.split.first
    @last_name = name.split.last
  end
  
  def first_name=(first_name)
    @first_name = first_name
  end
  
  def last_name=(last_name) 
    @last_name = last_name
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"