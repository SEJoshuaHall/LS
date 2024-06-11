def diamond(int)
  (1..int).step(2) do |stars|
    puts ("*" * stars).center(int)
  end
  (int - 2).step(0, -2) do |stars|
    puts ("*" * stars).center(int)
  end  
end

diamond(1)
diamond(3)
diamond(9)