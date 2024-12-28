# frozen_string_literal: true

require 'date'

# Meetup creates an object with a month and year and a method to return a specific day of that month and year based on user inquiry.
class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    weekday_dates = weekdays_of_month(weekday.downcase)
    day = select_day(weekday_dates, schedule.downcase)
    Date.civil(@year, @month, day) unless day.nil?
  end

  private

  def weekdays_of_month(weekday)
    weekday = day_number(weekday)
    first_of_month = Date.new(@year, @month, 1)
    last_of_month = Date.new(@year, @month, -1)
    (first_of_month..last_of_month).select { |date| date.wday == weekday }.map(&:day)
  end

  def day_number(weekday)
    lookup_days = { 'sunday' => 0, 'monday' => 1, 'tuesday' => 2, 'wednesday' => 3, 'thursday' => 4, 'friday' => 5,
                    'saturday' => 6 }
    lookup_days[weekday]
  end

  def select_day(weekday_dates, schedule)
    case schedule
    when 'first'
      weekday_dates[0]
    when 'second'
      weekday_dates[1]
    when 'third'
      weekday_dates[2]
    when 'fourth'
      weekday_dates[3]
    when 'fifth'
      weekday_dates[4] || nil
    when 'last'
      weekday_dates.last
    when 'teenth'
      weekday_dates.select { |date| date > 12 && date < 20 }[0]
    end
  end
end
