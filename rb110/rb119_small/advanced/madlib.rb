=begin
PEDAC
PROBLEM
Take a text file, read it, replace keywords, and print to screen.

DATA
txt file
hash
stdout

ALG
read file and save to variable
set subs hash
iterate over file and for each keyword, substitute a random word from the array corresponding to the keyword hash key
print to screen

=end

file = File.read('madlib.txt')
subs = {
        :adjectives => ['quick', 'lazy', 'sleepy', 'ugly'],
        :nouns => ['fox', 'dog', 'head', 'leg'],
        :verbs => ['jumps', 'lifts', 'bites', 'licks'],
        :adverbs => ['easily', 'lazily', 'noisily', 'excitedly']
        }
to_sub = %w(noun adjective verb adverb)

loop do
  file.sub!('adjective', subs[:adjectives].sample)
  file.sub!('noun', subs[:nouns].sample)
  file.sub!('adverb', subs[:adverbs].sample)
  file.sub!('verb', subs[:verbs].sample)
  break unless to_sub.any? { |s| file.include? s }
end

puts file