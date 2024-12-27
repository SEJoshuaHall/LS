# frozen_string_literal: true

# This class creates a Clock object which represents time in this format: "00:00".
class Clock
  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    minutes += yield if block_given?
    Clock.new(hours, minutes)
  end

  def +(min = 0)
    add_hours, @minutes = (@minutes + min).divmod(60)
    @hours = (@hours + add_hours) % 24
    Clock.new(@hours, @minutes)
  end

  def -(other)
    other = @minutes - other
    if other >= 0
      @minutes = other
    else
      other -= 60 # adjust hours offset for negative minutes
      subtract_hours, other = (-other).divmod(60)
      @minutes = 60 - other unless other.zero?
    end
    subtract_hours(subtract_hours)
    Clock.new(@hours, @minutes)
  end

  def subtract_hours(subtract_hours)
    subtract_hours = 0 if subtract_hours.nil?

    hours = @hours - subtract_hours
    hours = hours % 24
    @hours = if hours >= 0
               hours
             else
               hours + 24
             end
  end

  def to_s
    "#{format('%02i', @hours)}:#{format('%02i', @minutes)}"
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  protected

  attr_reader :hours, :minutes
end
