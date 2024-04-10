require 'securerandom'

=begin

TROUBLE WITH
Problems 2, 10, 14, 15

arr = ['10', '11', '9', '7', '8']

p arr.sort {|a,b| b.to_i <=> a.to_i}

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]



arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].key(0)



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_ages = 0

munsters.each_pair do |k, v|
  if v["gender"] == "male"
    total_male_ages += v["age"]
  end
end

puts total_male_ages


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = "AEIOUaeiou"
hsh.each_value do |arr|
  arr.each do |str|
    iterating_chars = str.chars
    iterating_chars.each do |character|
      p character if vowels.include?(character)
    end
  end
end


arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

p arr2


arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hash|
  inc_hsh = {}
  hash.each do |key, value|
    inc_hsh[key] = value + 1  
  end
end

p arr2



arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr2 = arr.map do |arr|
  arr.select do |e|
    e % 3 == 0
  end
end

p arr2



arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = {}
arr.map do |array|
  hsh[array[0]] = array[1]
end

p hsh


arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr2 = arr.sort_by do |arr|
  arr.select do |element|
    element.odd?
  end
end

p arr2

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh2 = hsh.map do |key, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  else
    value[:size].upcase
  end
end

p hsh2



arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

p arr2




def uuid(none)
  return_value = ''
  nums = SecureRandom.hex
  nums = nums.chars
  8.times do
    return_value << nums.pop
  end
  return_value << "-"
  4.times do
    return_value << nums.pop
  end
  return_value << "-"
  4.times do
    return_value << nums.pop
  end
  return_value << "-"
  4.times do
    return_value << nums.pop
  end
  return_value << "-"
  12.times do
    return_value << nums.pop
  end
  return_value
end

p uuid(1)




=end

