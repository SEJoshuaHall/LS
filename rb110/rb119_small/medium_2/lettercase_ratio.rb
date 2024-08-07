=begin
PROBLEM
take a string, find the percentage of uppercase, lowercase, and neithercase characters, and return in a hash format

DATA
input: string
alphabet array
characters array
Output: hash with values

ALG
set alphabet variable to lowercase letters
split string into chars and save as str_chars
set hash with keys set to 0.0
iterate over str_chars
  if alphabet, upcase, neither, update hash with count
set total to str.length
iterate over hash transforming to %
return hash

Updated to use a helper method.

=end
ALPHA = %w(q w e r t y u i o p a s d f g h j k l z x c v b n m).freeze


def get_count(str_chars)
  tally = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  str_chars.each do |char|
    if ALPHA.include?(char)
      tally[:lowercase] += 1
    elsif ALPHA.include?(char.downcase)
      tally[:uppercase] += 1
    else
      tally[:neither] += 1
    end
  end
  tally
end

def letter_percentages(str)
  str_chars = str.chars
  size = str.length
  tally = get_count(str_chars)
  tally.transform_values! {|count| (count / size * 100).round(2)}
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')