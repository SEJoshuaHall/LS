
def is_prime?(int)
  (2..(int-1)).each do |div|
    return false if int % div == 0
  end
  true
end

def nth_prime(int)
  current_num = 3
  count_prime = 1
  loop do
    if is_prime?(current_num)
      count_prime += 1
    end
    break if count_prime >= int
    current_num += 1
  end
  current_num
end

p nth_prime(10001)
