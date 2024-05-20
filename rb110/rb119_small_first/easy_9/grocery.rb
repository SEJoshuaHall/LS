=begin

PROBLEM
Take grocery list array with quantities and convery to correct number of each fruit


EXAMPLES
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]


DATA
input arr
output arr


ALGORYTHM
iterate over subarrays returning first index second index times into new array


CODE
=end

def buy_fruit(arr)
  result = []
  arr.each do |pair|
    pair[1].times do
      result << pair[0]
    end
  end
  result
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]