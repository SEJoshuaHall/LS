class MyCar
  attr_accessor :speed, :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up
    self.speed += 5
  end

  def brake
    self.speed -= 5
  end

  def shut_off
    self.speed = 0
  end

  def how_fast
    puts self.speed
  end

  def spray_paint(new_color)
    self.color = new_color
  end
end

maggy = MyCar.new(2004, "Gold", "Marquis")
maggy.how_fast
maggy.speed_up
maggy.how_fast
maggy.speed_up
maggy.how_fast
maggy.brake
maggy.how_fast
maggy.shut_off
maggy.how_fast
puts maggy.color
maggy.spray_paint("Red")
puts maggy.color
puts maggy.year