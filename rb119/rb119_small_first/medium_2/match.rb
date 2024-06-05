=begin

PROBLEM
take string, test if all opening parentheses are matched with a closing one.


EXAMPLES
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false


DATA



ALGORYTHM



CODE
=end

def balanced?(str)
  count = 0
  str.chars.each do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
    break if count < 0
  end
  count == 0 ? true : false
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