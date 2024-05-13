=begin

PROBLEM
take a string, count uppercase, lowercase, and symbols (inc. spaces), and return hash with three entries giving percent flotes for each category 


EXAMPLES
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


DATA



ALGORYTHM



CODE
=end

def letter_percentages(str)
  percent_hash =  { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  length = str.length
  lowercase, uppercase, neither = 0, 0, 0
  str.chars.each do |char|
    if ('a'..'z').include?(char)
      lowercase += 1

    elsif ('A'..'Z').include?(char)
      uppercase += 1
    else
      neither += 1
    end
  end
  percent_hash[:lowercase] = (lowercase.to_f/length*100).round(1)
  percent_hash[:uppercase] = (uppercase.to_f/length*100).round(1)
  percent_hash[:neither] = (neither.to_f/length*100).round(1)
  percent_hash
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { :lowercase=>66.7, :uppercase=>33.3, :neither=>0.0 }