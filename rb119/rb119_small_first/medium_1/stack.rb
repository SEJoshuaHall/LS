=begin

PROBLEM



EXAMPLES
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


DATA
input: series of commands in a string
convert string to array of commands
register variable
stack array
output: data to stdout


ALGORYTHM
convert input string to array of commands
initialize register variable to integer 0
initialize stack variable to array
command method - takes commands array, registeer, and stack as args
  set working_num variable
  iterate over commands
    if integer, set working_num to integer
    n - place value in register
    PUSH - push register value to stack
    ADD - pop value from stack and add to register value and update register with new value
    SUB - pop value from stack and subtract from register value and update register with new value
    MULT - pop value from stack and multiply by register value and update register with new value
    DIV - pop value from stack and divide into register value and update register with new value
    MOD - pop value from stack and divide into register value and update register with remainder
    POP - remove topmost item from stack and place in register
    PRINT - print register value
CODE
=end

def minilang(str)
  commands_arr = str.split
  register = 0
  stack = []
  commands_arr.each do |command|
    case command
      when (0..9).include?(command) then register = command
      when 'PUSH' then stack << register
      when 'ADD' then register += stack.pop
      when 'SUB' then register -= stack.pop
      when 'MULT' then register *= stack.pop
      when 'DIV' then register /= stack.pop
      when 'MOD' then register %= stack.pop
      when 'POP' then register = stack.pop
      when 'PRINT' then puts register
      else register = command.to_i
    end
end

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

###############################################################################################################

=begin

PROBLEM
convert expression to set of commands


EXAMPLES
(3 + (4 * 5) - 7) / (5 % 3)
convert to:
a = "4 MULT 5" 
b = "3 ADD #{a} SUB 7"
c = "5 MOD 3"
d = "#{b} DIV #{c}"

DATA
Input: expression: (3 + (4 * 5) - 7) / (5 % 3)
holding variables
hash of symbols to commands
Print to screen
Output: error or nil

ALGORYTHM
find next set of () to convert
convert expression to commands
pass commands to minilang()
replace () with result
break when no more ()

CODE
=end
#Concluded this is not possible because of the way SUB works and becasue there is no way to take an integer from the code and place it on the stack without deleting the element from the register.
def converter(segment)
  result = []
  arr_commands = segment.delete(' ').delete('(').delete(')').chars
  arr_commands.each do |command|
    case command
    when .include(0..9) then result << command
    when '*' then result << 'MULT'
    when '/' then result << 'DIV'
    when '+' then result << 'ADD'
    when '-' then result << 'SUB'
    when '%' then result << 'MOD'
    end
  end

end

when 'PUSH' then stack << register
when 'POP' then register = stack.pop

def minilang_numeric(expression)
  commands = []
  next_segment = expression.scan(/\([^\(\)]+?\)/m)[0]
  converter(next_segment)
  commands << 'PRINT'
  #minilang(commands)
end

minilang_numeric('(3 + (4 * 5) - 7) / (5 % 3)') # => 8
(4*5) => 4 PUSH 5 MULT PUSH #'4' places 4 into register, 'PUSH' moves 4 from register to stack, '5' places 5 into register, 'MULT' removes 4 from stack, multiplies by the 5 in the register, and replaces the register value with the result, 'PUSH' moves result into the stack
#Stack = 20, Register = NA
(3+R-7) => 3 ADD PUSH 7#'3' places 3 into register, 'ADD' removes 20 from stack adds to 3 in register updates register to 23,

(5%3)
