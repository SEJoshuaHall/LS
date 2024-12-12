items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(food)
  puts "Let's start gathering food."
  yield(food)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts "#{produce.join(', ')}" }