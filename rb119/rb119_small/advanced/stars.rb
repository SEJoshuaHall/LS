=begin
PROBLEM
take an int, create an 8-point star int high and int wide

DATA

ALG
num = int / 2
count = 1
loop do
  string = " " * int
  string[count], string[num + 1], string[-count] = '*', '*', '*'
  p string
  count += 1
  break if count > num
end
p '*' * int
int times
  1st 1, mid, last
  2 mid 2nd
  3 mid 3rd
  all if first is mid

=end

def star(star_size)
  quad_size = star_size / 2
  center = star_size / 2
  target = 0
  loop do
    string = ' ' * star_size
    string[target], string[center], string[-(target + 1)] = '*', '*', '*'
    puts string
    target += 1
    break if target > quad_size
  end
  target -= 1
  puts '*' * star_size
  loop do
    string = ' ' * star_size
    string[target], string[center], string[-(target + 1)] = '*', '*', '*'
    puts string
    target -= 1
    break if target < 0
  end
end

star(19)