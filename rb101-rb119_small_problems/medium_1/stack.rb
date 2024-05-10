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

require 'pry'

def commands(commands_arr, register, stack)
  commands_arr.each do |command|
    case command
      when 'n' then register = command
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
    # binding.pry
    # p register
    # p command
    # p stack
  end
end

def minilang(str)
  commands_arr = str.split
  register = 0
  stack = []
  commands(commands_arr, register, stack)
end

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
