puts "Type as many words as you want!"
word_list = []
loop do
  word = gets.chomp
  if word == ''
    break
  else
    word_list << word
  end
end

puts word_list.sort

