=begin

# Give arity for each set of code/type of closure
# Give differences between Proc and Lambda

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Procs have lenient arity unless they are lambdas

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Lambdas have strict arity even though they are from the Proc class.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# blocks with yield must have a block passed in!

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# The block parameter is nil by default. Blocks must have a parameter to accept an argument from yield.

# =begin

Differences between procs, blocks, and lambdas:
Blocks are not objects.
Procs have lenient arity, but not lmbdas.
Procs are created with .new
Lambdas are created with lambda or ->

blocks are used with yield or passed to methods
procs and lambdas are not objects and are called with either .call or ()

in proc, return will return fro enclosing method
in lambda, return will only return from lambda itself

=end

