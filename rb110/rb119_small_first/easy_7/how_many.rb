=begin

PROBLEM
when given an array, count the number of each unique element in the array and output in specified format


EXAMPLES
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

Expected Output

car => 4
truck => 3
SUV => 1
motorcycle => 2


DATA
Input is an array
Hash holds updated items and their counts
Output is a series of printed strings


ALGORYTHM
create empty hash
iterate through given array and if element is in hash, add 1 to the count, else add element with count of 1


CODE
=end

def count_occurrences(arr)
  hsh = {}
  arr.each do |e|
    hsh.key?(e) ? hsh[e] +=1 : hsh[e] = 1
  end
  arr2 = hsh.keys
  arr2.each do |e|
    puts "#{e} => #{hsh[e]}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

=begin
Expected Output
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end