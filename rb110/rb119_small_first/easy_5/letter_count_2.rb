

def word_sizes(str)
  hsh = {}
  str = str.delete('^A-Za-z ').split(' ')
  str.each do |word|
    if hsh.has_key?(word.length)
      hsh[word.length] += 1
    else
      hsh[word.length] = 1
    end
  end
  hsh
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}