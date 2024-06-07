# def staggered_case(str, first_upper = true)
#   result = str.chars.map.with_index do |char, idx|
#     if idx.odd?
#       char.downcase
#     else
#       char.upcase
#     end
#   end
#   result = result.join
#   result.swapcase! unless first_upper
#   result
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'.swapcase
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case(str, next_upper = true)
  result = str.chars.map do |char|
    next_upper ? char.upcase! : char.downcase!
    next_upper = !next_upper if (("A".."Z").to_a + ("a".."z").to_a).include?(char)
    char
  end
  result.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ALL CAPS', false) == 'AlL cApS'.swapcase
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'