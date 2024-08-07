=begin

str = 'The grass is green'

p str[4, 5]


arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
p arr[2, 3]
p arr[2, 3][0]


arr = [1, 'two', :three, '4']
p arr[3, 1] # => ["4"]
p arr[3..3] # => ["4"]
p arr[3]    # => "4"


str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

p str.fetch(-6)
p arr.fetch(-6)


hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'


str = 'practice'

arr = str.chars
p arr

arr = arr.join
p arr


str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'

p str


arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr


hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'

p hsh



=end
