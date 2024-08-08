# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# increment(5) do |num|
#   puts num
# end

# def compare(arg)
#   puts "Before: #{arg}"
#   after = yield(arg)
#   puts "After: #{after}"
# end

# compare('hi') { |word| word.upcase }
# compare('Hello') { |word| word.slice(1..2) }
# compare('hello') { |word| "nothing to see!" }
# compare('hello') { |word| puts "hi" }

# def time_it
#   time_before = Time.now
#   yield
#   time_after = Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { sleep(1) }

# time_it { "hello world" }

# def test(&block)
#   puts "What's &block? #{block}"
# end

# test { sleep(1) }

# def test2(block)
#   puts "Hello!"
#   block.call
#   puts "Goodbye!"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { |prefix| puts "xyz" }


# def display(block)
#   block.call(">>>")
# end

# def test(&block)
#   puts "1"
#   display(block)
#   puts "2"
# end

# test { |prefix| puts prefix + "xyz" }


def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results


def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call
p s1.call
p s1.call
puts

s2 = sequence
p s2.call
p s1.call
p s2.call