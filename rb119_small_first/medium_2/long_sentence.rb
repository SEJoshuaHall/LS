=begin

PROBLEM
take contents of file, print longest sentence by number of words, and print number of words
sentences end in .?!


EXAMPLES
lengthy text


DATA
input: text
array for sentences
variable for holding longest sentence
variable for number of words in sentence
output: sentence and number of words

ALGORYTHM
set sentence variable and words variable
convert text to sentences array
iterate over each sentence to determine words length, then if longest, replace sentence variable with sentence and update words variable
print results


CODE
=end

def longest_sentence_finder(txt)
  longest_sentence = ''
  number_words = 0
  array_sentences = txt.split(/[!?.]/)
  array_sentences.each do |sentence|
    words = sentence.split(' ')
    if words.count > number_words
      number_words = words.count
      longest_sentence = words.join(" ")
    end
  end
  puts "The longest sentence is: \"#{longest_sentence}\""
  puts "It contains #{number_words} words!"
end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

longest_sentence_finder(text)