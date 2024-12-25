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
    @minutes = @minutes + min
    Clock.new(@hours, @minutes)
  end

  def -(minutes)
  end
  
  def to_s
    "%02i" % [@hours] + ":" + "%02i" % [@minutes]
  end

  private

  attr_reader :hours, :minutes

  protected

  def ==(other)
    return false unless other.respond_to?(:hours) && other.respond_to?(:minutes)
    hours == other.hours && minutes == other.minutes
  end
end

my_clock = Clock.at(9, 8)
my_clock2 = Clock.at(9, 8)
p my_clock == my_clock2
