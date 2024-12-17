# class Person
#   GREETINGS = ['Hello', 'Hi', 'Hey']

#   def self.greetings
#     GREETINGS.join(', ')
#   end

#   def greet
#     GREETINGS.sample
#   end
# end

# puts Person.greetings          # => "Hello, Hi, Hey"
# puts Person.new.greet          # => "Hi" (output may vary)


def multiplier(factor)
  Proc.new {|n| n*factor}
end

double = multiplier(2)

p double.call(2)b 