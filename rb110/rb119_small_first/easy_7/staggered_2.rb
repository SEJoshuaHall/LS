
def staggered_case(str)
  str_2 = str.chars
  to_upcase = true
  result = ''
  counter = 0
  loop do
    if /[A-Za-z]/.match?(str_2[counter])
      result << (to_upcase ? str_2[counter].upcase : str_2[counter].downcase)
      to_upcase = !to_upcase
    else
      result << str_2[counter] 
    end
    counter += 1
    break if counter >= str.length
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'