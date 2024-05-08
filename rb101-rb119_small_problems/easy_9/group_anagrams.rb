=begin

PROBLEM
take an array of words, and find all the words which have the same letters as another word and print out each set of anagrams as its own array


EXAMPLES
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


DATA
input: array of words
hash with keys as alphabetizes representations of each word and values as arrays of their corresponding words
output: printouts of arrays of anagrams


ALGORYTHM
create hash
iterate over array finding the alphabetized version of each word and assigning it to the hash with its corresponding word
print out each hash value with 2 or more words


CODE
=end

def anagrams(arr)
  hsh = {}
  arr.each do |word|
    ordered = word.chars.sort#.join
    if hsh.key?(ordered)
      hsh[ordered] << word
    else
      hsh[ordered] = [word]
    end
  end
  hsh.each_pair do |_, v|
    unless !v[1]
      p v
    end
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'no']

anagrams(words)