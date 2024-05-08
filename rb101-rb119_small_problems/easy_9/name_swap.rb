=begin

PROBLEM
take string containing first and last name with a space between and convert to string last comma first


EXAMPLES
swap_name('Joe Roberts') == 'Roberts, Joe'


DATA



ALGORYTHM



CODE
=end

def swap_name(name)
  arr = name.split
  "#{arr[1]}, #{arr[0]}"
end


p swap_name('Joe Roberts') == 'Roberts, Joe'