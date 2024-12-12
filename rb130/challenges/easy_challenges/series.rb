class Series
  def initialize(str)
    @str = str.chars
  end

  def slices(int)
    raise ArgumentError if int > @str.size
    result = []
    place = 0
    loop do
      sub_result = []
      count = place
      int.times do
        sub_result << @str[count].to_i
        count += 1
      end
      place += 1
      result << sub_result
      break if place == @str.size - int + 1
    end
    result
  end
end

