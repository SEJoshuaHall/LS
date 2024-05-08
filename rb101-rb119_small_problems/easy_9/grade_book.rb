=begin

PROBLEM
take 3 positive integers between 1 and 100, and return a letter grade based on their mean.


EXAMPLES
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

DATA



ALGORYTHM



CODE
=end

def get_grade(int, int2, int3)
  score = (int + int2 + int3) / 3
  grade = ''
  if score > 90
    grade = 'A'
  elsif score > 80 && score < 91
    grade = 'B'
  elsif score > 70 && score < 81
    grade = 'C'
  elsif score > 60 && score < 71
    grade = 'D'
  else
    grade = 'F'
  end
  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
