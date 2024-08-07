=begin
PROBLEM
read the contents of a text file, find and return the longest sentence by word count. Sentences ende with .?!

EXAMPLES
'--' counts as a word

DATA
start with a text file.
variable to hold sentences
variable to hold longest sentence
variable to hold word count

ALG
split text into sentences and save in sentences
iterate over sentences and save longest so far to longest_sentence, and it''s length to longest_length
print out "sentence" is the longest and contains 'x' words.

=end
puts "What file do you want to load?"
book = gets.chomp
file = File.read(book)

sentences = file.split(/(?<=\.)|(?<=\?)|(?<=!)/)
longest_sentence = ''
longest_length = 0

sentences.each do |string|
  if string.split.count > longest_length
    longest_sentence = string
    longest_length = string.split.count
  end
end

print "The longest sentence is, '#{longest_sentence}' with #{longest_length} words!"