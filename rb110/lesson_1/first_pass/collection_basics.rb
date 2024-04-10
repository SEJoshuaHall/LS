=begin
str = 'abcdefghi'
p str[2]
p str [2, 3]

str = 'The grass is green'
p str[4, 5]
p str.slice(4, 5)

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
p arr[2, 3][0]


arr = [1, 'two', :three, '4']
p arr.slice(1, 2)
p arr.slice(3..3)
p arr.slice(3)

hsh = {'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit'}
p hsh['apple']
p hsh['pear'][0]

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
p country_capitals.keys      # => [:uk, :france, :germany]
p country_capitals.values    # => ["London", "Paris", "Berlin"]
p country_capitals.values[0] # => "London"

str = 'abcdefg'
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
p str[-8]
p str [-8]

hsh = { :a => 1, 'b' => 'two', :c => nil }
p hsh['b']
p hsh[:c]
p hsh['c']
p hsh[:d]
p hsh.fetch(:c)
p hsh.fetch('c')
p hsh.fetch(:d)


=end

str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
p arr
p str

p arr.join # => "Practice"

str2 = 'How do you get to Carnegie Hall?'
str2.split
p 'here'
p str2
arr2 = str2.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
p arr2

p arr2.join        # => "HowdoyougettoCarnegieHall?"
arr2.split
p arr2
