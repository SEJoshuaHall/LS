=begin
PROBLEM
take a string, and check for two things: every ( is followed by a ) and no ) comes before its (.

DATA
input: string
count variable
output: boolean

ALG
set count to 0
iterate over characters
  if ( +1
    if ) -1
    if count < 0 return false
count == 0
=end

def balanced?(str)
  count = 0
  str.chars.each do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
    return false if count < 0
  end
  count == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false