def print_in_box(str)
  length = str.length
  p "+-" + ("-" * length) + "-+"
  p "| " + (" " * length) + " |"
  p "| " + str + " |"
  p "| " + (" " * length) + " |"
  p "+-" + ("-" * length) + "-+"
end

print_in_box("To boldly go where no one has gone before.")


print_in_box("")
