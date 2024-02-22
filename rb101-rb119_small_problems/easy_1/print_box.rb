def print_in_box(str)
  puts '+-' + ('-' * str.length) + '-+'
  puts '| ' + (' ' * str.length) + ' |'
  puts '| ' + str + ' |'
  puts '| ' + (' ' * str.length) + ' |'
  puts '+-' + ('-' * str.length) + '-+'
end

print_in_box("This is a test!")
