=begin


alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char
  end

  counter += 1
  break if counter == alphabet.size
end

p selected_chars



fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << (current_element + 's')

  counter += 1
  break if counter == fruits.size
end

  p transformed_elements


def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]
    
    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

    selected_chars
end

p select_vowels('the quick brown fox')      # => "euioo"
sentence = 'I wandered lonely as a cloud'
p select_vowels(sentence)                   # => "Iaeeoeaaou"



produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  return_list = {}
  produce_list_keys = produce_list.keys
  counter = 0

  loop do
    break if counter >= produce_list_keys.length

    current_item = produce_list_keys[counter]

    if produce_list[current_item] == 'Fruit'
      return_list[produce_list_keys[counter]] = produce_list[current_item] 
    end

    counter += 1
  end

  return_list
end


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


def double_numbers(numbers)
  numbers.map! do |n|
    n *= 2
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers



def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]



def multiply(numbers, multiple)
  multiples = []
  counter = 0

  loop do
    multiples << numbers[counter] * multiple
    counter +=1
    break if counter >= numbers.length
  end
  multiples
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers = [1, 4, 3, 7, 2, 6]



=end




