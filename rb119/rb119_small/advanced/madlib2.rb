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