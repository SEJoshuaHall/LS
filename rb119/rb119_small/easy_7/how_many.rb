def count_occurrences(items)
  count = {}
  items.each do |item|
    item.downcase!
    count.keys.include?(item) ? (count[item] += 1) : (count[item] = 1)
  end
  count.each do | item, count|
    puts "#{item} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'Truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)