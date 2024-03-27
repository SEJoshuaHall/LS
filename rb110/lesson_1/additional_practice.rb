=begin

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_flintstones = {}
flintstones.each_with_index do |value, index|
  new_flintstones[value] = index
end

p new_flintstones


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_total = 0

ages.each_pair {|k, v| ages_total += v}

p ages_total


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if {|k, v| v < 100}

p ages


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
minimum_age = 1000000

ages.each do |k, v|
  if v < minimum_age 
  then minimum_age = v
  end
end

p minimum_age


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
find_index = 0
flintstones.each_with_index do |each, index|
  if each.start_with?('Be')
    find_index = index
    break if find_index == index
  end
end

p find_index


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0, 3]}

p flintstones


statement = "The Flintstones Rock"

count_letters = {}

statement.chars.each do |char|
  if count_letters.member?(char)
    count_letters[char] += 1
  else
    count_letters[char] = 1
  end
end

p count_letters


numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end


words = "the flintstones rock"

def titleize(str)
  arr = str.split
  arr.map! do |word|
    word.capitalize!
  end
  new_str = arr.join(' ')
end

puts titleize(words)

words = words.split.map { |word| word.upcase }.join(' ')
p words



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters = munsters.each do |k, v|
  if v['age'] < 18
  v['age_group'] = 'kid'
  elsif v['age'] > 64
  v['age_group'] = 'senior'
  else
  v['age_group'] = 'adult'
  end
end

p munsters


=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters = munsters.each do |name, details|
  case details["age"]
  when 0...18
    details['age_group'] = 'kid'
  when 18...65
    details['age_group'] = 'adult'
  when 65..1000000
    details['age_group'] = 'senior'
  end
end

p munsters