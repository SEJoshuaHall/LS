class Minilang
  def initialize(commands)
    @register = 0
    @commands = commands.split
    @stack = []
  end
  
  def eval
    @commands.dup.each do |command|
      if command == command.dup.to_i.to_s then @register = command.to_i
      elsif command == 'PUSH' then @stack << @register
      elsif @stack.empty? && (command == 'ADD' || command == 'SUB' || command == 'MULT' || command == 'DIV' || command == 'MOD' || command == 'POP') then raise TypeError.new("Empty stack!")
      elsif command == 'ADD' && !@stack.empty? then @register += @stack.pop.to_i
      elsif command == 'SUB' && !@stack.empty? then @register -= @stack.pop.to_i
      elsif command == 'MULT' && !@stack.empty? then @register *= @stack.pop.to_i
      elsif command == 'DIV' && !@stack.empty? then @register /= @stack.pop.to_i
      elsif command == 'MOD' && !@stack.empty? then @register %= @stack.pop.to_i
      elsif command == 'POP' && !@stack.empty? then @register = @stack.pop.to_i
      elsif command == 'PRINT' then puts @register

      else raise TypeError.new("Invalid token: #{command}")
      end
    end
  end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)