def group_anagrams(array_words)
  result = []
  array_words.each do |word|
    sub_array = []
    array_words.each do |comparitor|
      if word.chars.sort == comparitor.chars.sort
        sub_array << word
        sub_array << comparitor
      end
    end
    result << sub_array.uniq.sort
  end
  result.uniq.each do |sub|
    p sub
  end 
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams(words)
          
# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)