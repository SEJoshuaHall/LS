=begin

PROBLEM
take string and capitalize every odd indexed character and lowercase every even indexed character


EXAMPLES
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


DATA
Input: string
Output: new string


ALGORYTHM
create duplicate string
loop over every index character upcasing or downcasing based on the index


CODE
=end

def staggered_case(str)
  str_2 = str.dup
  counter = 0
  until counter == str.length
    if counter.odd?
      str_2[counter] = str_2[counter].downcase
    elsif counter.even?
      str_2[counter] = str_2[counter].upcase
    end
    counter += 1
  end
  str_2
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'