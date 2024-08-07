GRADES = {((90..100).to_a) => 'A', ((80..89).to_a) => 'B', ((70..79).to_a) => 'C', ((60..69).to_a) => 'D', ((0..59).to_a) => 'F', }

def get_grade(*grades)
  number = *grades.count
  total = *grades.inject(:+)
  average = total[0] / number[0]
  grade = ''
  GRADES.each do |array_numbers, letter|
    if array_numbers.include?(average)
      grade << letter
    end
  end
  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"