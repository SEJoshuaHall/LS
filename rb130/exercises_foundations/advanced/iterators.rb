=begin

create new enumerator object
define what values are iterated upon
  iterate over infinite list of factorials

test by printing first 7 factorial values, starting with 0 using an external iterator
print 3 more
reset with rewind
print 7 more

=end

factorals = Enumerator.new do |y|
  n = 0
  factorial = 1
  loop do
    y << factorial
    n += 1
    factorial *= n
  end
end

7.times { puts factorals.next }
3.times { puts factorals.next }
factorals.rewind
7.times { puts factorals.next }
