#Mathematical solution, squares are left on...
def lights_on(int)
  result = [1]
  counter = 1
  loop do
    counter += 1
    break if counter * counter > int
    result << counter * counter
  end
  result
end

#Algorithmic solution
def lights_on_alg(int)
  sockets = {}
  1.upto(int) do |light_num|
    sockets[light_num] = false
  end
  1.upto(int) do |nth|
    (0..int).step(nth) {|switch| sockets[switch] ? sockets[switch] = false : sockets[switch] = true }
  end
  sockets.delete(0)
  lights_on = []
  sockets.each_pair do |k, v|
    lights_on << k if v
  end
  lights_on
end

# p lights_on(10)
p lights_on_alg(10)