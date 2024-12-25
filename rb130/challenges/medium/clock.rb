=begin
P
take a time and subtract minutes and rollover to previous day

E
00:40 - 70
23:30

A
subtract from minutes.
if not negative, return as new minutes
else
divmod for subtract_hours and
if 0, 0
else + 60 SET minutes

subtract from hours
if not negative, return as new hours
else
  modulo 24
  if 0, 0
else + 24 SET hours

=end

class Clock
  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    if block_given?
      minutes = minutes + yield
    end
    Clock.new(hours, minutes)
  end

  def +(min=0)
    add_hours, @minutes = (@minutes + min).divmod(60)
    @hours = (@hours + add_hours) % 24
    Clock.new(@hours, @minutes)
  end

  def -(minutes)
    minutes = @minutes - minutes
    if minutes >= 0
      @minutes = minutes
    else
      minutes = minutes - 60 #adjust hours offset for negative minutes
      subtract_hours, minutes = (-minutes).divmod(60)
      @minutes = 60 - minutes  unless minutes == 0
    end
    if subtract_hours == nil then subtract_hours = 0
    end

    hours = @hours - subtract_hours
    hours = hours % 24
    if hours >= 0
      @hours = hours
    else
      @hours = hours + 24
    end
    Clock.new(@hours, @minutes)
  end
  
  def to_s
    "%02i" % [@hours] + ":" + "%02i" % [@minutes]
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
  
  private
  
  
  protected
  attr_reader :hours, :minutes
  
end

my_clock = Clock.at(1)
p (Clock.at(10, 30) - 5).to_s

