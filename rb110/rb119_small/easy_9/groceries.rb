def buy_fruit(arr_fruit_count)
  list = []
  arr_fruit_count.each do |sub|
    sub[1].times do
      list << sub[0]
    end
  end
  list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]