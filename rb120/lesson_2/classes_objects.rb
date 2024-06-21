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
  
  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  private
  
  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
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
=end



class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end
  
  private
  
  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
 
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name