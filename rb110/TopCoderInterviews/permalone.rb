=begin

Return the number of total permutations of the provided string that don't have repeated consecutive letters. Assume that all characters in the provided string are each unique.

For example, `aab` should return 2 because it has 6 total permutations (`aab`, `aab`, `aba`, `aba`, `baa`, `baa`), but only 2 of them (`aba` and `aba`) don't have the same letter (in this case `a`) repeating.


PROBLEM
find every combination of given letters
select ones without 2 of same letters in a row
find count of all letters for which there are more than 1 - array
count qualifying strings
multiply count by each number in array and return the result

EXAMPLES
if length is 1, return 1
elsif only 1 character return 0

DATA
input string
array of all possible combinations
array of qualifying combinaations
array of letter counts greater than 1
output integer

ALG
set combos
      HELPER get combos
        get all possible combinations
        set array to each character
        loop 
          concat str to combos
          swap final 2
          concat
          swap -3, -2
          concat
          swap -2 -1
          concat
          repeat for length of string
set qualifying
          HELPER
          find qualifying
            loop over combos
              if no 2 consecutive are the same concat
                switch to true
                iterate over chars with index
                  next if first
                  if any are the same as previous
                    switch = false
              if switch true concat
return count


def get_combos(str)
  combos = []
  str.chars.permutation(str.length) {|permutation| combos << permutation }
  combos
end

def get_qualifying(combos)
  result = []
  combos.each do |arr|
    qualifies = true
    arr.each_with_index do |char, idx|
      next if idx == 0
      if char == arr[idx - 1]
        qualifies = false
      end
    end
    result << arr if qualifies
  end
  result
end
  
def permAlone(str)
  combos = get_combos(str)
  qualifying = get_qualifying(combos)
  qualifying.count
end


p permAlone("aab") == 2
p permAlone("aabb") == 8
p permAlone("abcdefa") == 3600
p permAlone("abfdefa") == 2640
p permAlone("a") == 1
p permAlone("aaab") == 0
p permAlone("aaabb") == 12
p permAlone("zzzzzzzz") == 0
p permAlone("aaa") == 0

=end
