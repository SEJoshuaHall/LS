def neutralize(sentence)
  words = sentence.split(' ')
  result = []
  words.each do |word|
    result << word unless negative?(word)
  end

  result.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.