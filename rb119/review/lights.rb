=begin
PROBLEM
Take an integer, set that number of lights' in a bank, and iterate over each number from 1 to integer, changing the status of every nth light, then return the list of final lights on. All lights start in the off position.

DATA
Input: integer
hash to hold lights
Output: array of selected on lights

ALGORITHM
set lights hash
set 1 to integer hash keys to a value of false (off)
iterate over 1 to integer turning each nth light
  if modulo n is 0
    value = not value
select keys with true value and return as array

=end
def lights(int)
  lights = {}
  (1..int).each {|int| lights[int] = false}
  (1..int).each do |int|
    lights.each do |light, state|
      if light % int == 0
        lights[light] = !lights[light]
      end
    end
  end
  result = []
  lights.each_pair {|light, state| result << light if state}
  result
end


p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
