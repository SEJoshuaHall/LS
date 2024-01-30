contents_array = ["TABLE OF CONTENTS", "Chapter 1: Numbers", "Chapter 2: Letters", "Chapter 3: Variables", 'page 1', 'page 5', 'page 9']

line_width = 40
puts(contents_array[0].center(line_width))
puts(contents_array[1].ljust(line_width/2) + contents_array[4].rjust(line_width/2))
puts(contents_array[2].ljust(line_width/2) + contents_array[5].rjust(line_width/2))
puts(contents_array[3].ljust(line_width/2) + contents_array[6].rjust(line_width/2))