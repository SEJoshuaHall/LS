def doubles?(int)
  num = int.to_s
  return false if num.length.odd?
  half = num.length / 2
  num[0, (half)] == num[half, (half)]
end

def twice(int)
  if doubles?(int)
    return int
  else
    return int * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10