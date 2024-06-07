# def swap(str)
#   arr = str.split
#   arr.map! do |word|
#     if word.length > 1
#       word = word[-1] + word[1..-2] + word[0] unless word.length == 1
#     else
#       word
#     end
#   end
#   result = arr.join(" ")
# end

def swap(str)
  arr = str.split
  arr.map! do |word|
      word[0], word[-1] = word[-1], word[0]
      word
  end
  result = arr.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'