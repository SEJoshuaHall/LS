# def word_sizes(str)
#   counts = {}
#   str.split.each do |word|
#     if counts.keys.include?(word.length)
#       counts[word.length] += 1
#     else
#       counts[word.length] = 1
#     end
#   end
#   counts
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

def word_sizes(str)
  counts = {}
  str.split.each do |word|
    word.gsub!(/[^A-Za-z]/, '')
    if counts.keys.include?(word.length)
      counts[word.length] += 1
    else
      counts[word.length] = 1
    end
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}