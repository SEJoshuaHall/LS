def triangle(int)
  stars = 0
  loop do
    puts (' ' * int) + ('*' * stars)
    int -= 1
    stars += 1
    break if int == 0
  end
end

triangle(5)
triangle(9)


def triangle2(int)
  stars = int
  int = 0
  loop do
    puts (' ' * int) + ('*' * stars)
    int += 1
    stars -= 1
    break if stars == 0
  end
end

triangle2(5)
triangle2(9)