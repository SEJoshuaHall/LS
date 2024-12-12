class Clock
  attr_reader :hours, :minutes
  def initialize(hours, minutes=0)
    @hours = hours % 24
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    "#{sprintf("%02d", @hours.to_s)}:#{sprintf("%02d", @minutes.to_s)}"
  end

  def +(int)
    h = int/60
    m = int%60
    new_hours = @hours + h
    new_minutes = @minutes + m
    if new_minutes >= 60
      new_hours += 1
      new_minutes -= 60
    end
    new_hours = correct_hours(new_hours)
    Clock.new(new_hours, new_minutes)
  end

  def -(int)
    h = int/60
    m = int%60
    new_hours = @hours - h
    new_minutes = @minutes = m
    if new_minutes < 0
      new_hours -= 1
      new_minutes += 60
    end
    new_hours = correct_hours(new_hours)
    Clock.new(new_hours, new_minutes)
  end

  protected
  
  # attr_reader :hours, :minutes
  
  def correct_hours(hours)
    corrected = 0
    if hours > 23
      corrected = hours % 24
    elsif hours < 0
      hours = hours % 24
      hours = 24 - hours
    end
    hours
  end

  def ==(other)
    @hours == other.hours
    @minutes == other.minutes
  end
end

clock = Clock.at(10) + 3
p clock.to_s

