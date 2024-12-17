=begin

1.
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi #STDOUT 'Hello'

# hello = Hello.new
# hello.bye #no method error

# hello = Hello.new
# hello.greet #Wrong number of arguments error

# hello = Hello.new
# hello.greet("Goodbye") #STDOUT 'Goodbye'

# Hello.hi #No method error

2.
=end

require 'minitest/autorun'

class Car
  def initialize(t, y, c)
    @type = t
    @year = y
    @color = c
  end

  def 

end



assert_equal
assert_same
assert_raises