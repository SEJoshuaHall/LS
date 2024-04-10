=begin

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hsh = {}
flintstones.each_with_index do |item, index|
  hsh[item] = index
end

p hsh


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = 0
ages.each do |k, v|
  total += v
end

p total

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages = ages.select do |k, v|
  v < 100
end

p ages


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

selected = 0

flintstones = flintstones.each_with_index do |item, index|
  if item[0, 2] == 'Be'
    selected = index
    break
  end
end

p selected


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0, 3]}

p flintstones


statement = "The Flintstones Rock"

letter_count = {}
statement.each_char do |character|
  if letter_count.key?(character)
    letter_count[character] += 1
  else
    letter_count[character] = 1
  end
end

p letter_count


words = "the flintstones rock"

def titleize(str)
  str = str.split
  str.each {|element| element.capitalize!}
  str.join(' ')
end

p titleize(words)



=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details['age']
  when 0...18
    details['age_group'] = 'kid'
  when 18...65
    details['age_group'] = 'adult'
  else
    details['age_group'] = 'senior'
  end
end

p munsters