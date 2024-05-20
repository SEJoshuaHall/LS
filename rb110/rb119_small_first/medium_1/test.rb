METHODS = {
  PRINT: "print",
  PUSH: "push",
  ADD: "+",
  SUB: "-",
  MULT: "*",
  DIV: "/",
  MOD: "%",
  POP: "pop"
}

def process(pure_string)
  eval(pure_string)
end

def inner_formula(string)
  string.split(")")[0].reverse.split("(")[0].reverse
end

def minilang(string_formula)
  if !string_formula.match(/\(/)
    p process(string_formula)
  else
    in_the_paren = inner_formula(string_formula)
    will_sub = "(#{in_the_paren})"
    result = process(in_the_paren).to_s
    new_string = string_formula.sub!(will_sub, result)
    minilang(new_string)
  end
end

minilang("2 / 2 + 1 - 6") # => -4
minilang("2 * (9 + (8 / 4) - 1)") # => 20
minilang("(3 + (4 * 5) - 7) / (5 % 3)") # => 8
minilang("(2 + ((4 * 4) - 14) / (((1+2) / 3) * 2)) * 2") # => 6
minilang("(3 + (4 * 5) - 7) / (5 % 3)") # => 8