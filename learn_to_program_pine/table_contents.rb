opening = "TABLE OF CONTENTS"
ch1 = "Chapter 1: Numbers"
ch1_page = 'page 1'
ch2 = "Chapter 2: Letters"
ch2_page = 'page 5'
ch3 = "Chapter 3: Variables"
ch3_page = "page 9"
line_width = 40
puts(opening.center(line_width))
puts(ch1.ljust(line_width/2) + ch1_page.rjust(line_width/2))
puts(ch2.ljust(line_width/2) + ch2_page.rjust(line_width/2))
puts(ch3.ljust(line_width/2) + ch3_page.rjust(line_width/2))
