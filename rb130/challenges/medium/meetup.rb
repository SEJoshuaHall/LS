require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    weekday_dates = weekdays_of_month(weekday.downcase)
    day = select_day(weekday_dates, schedule.downcase)
    Date.civil(@year, @month, day)
  end

  private

  def weekdays_of_month(weekday)
    weekday = day_number(weekday)
    first_of_month = Date.new(@year, @month, 1)
    last_of_month = Date.new(@year, @month, -1)
    qualifying = (first_of_month..last_of_month).select { |date| date.wday == weekday }
    qualifying #use map
  end

  def day_number(weekday)
    case weekday
    when 'sunday' then return 0
    when 'monday' then return 1
    when 'tuesday' then return 2
    when 'wednesday' then return 3
    when 'thursday' then return 4
    when 'friday' then return 5
    when 'saturday' then return 6
    end
  end

  def select_day(weekday_dates, schedule)
    result = nil

    case schedule
    when 'first'
      then result = weekday_dates[0]
    when 'second'
      then result = weekday_dates[1]
    when 'third'
      then result = weekday_dates[2]
    when 'fourth'
      then result = weekday_dates[3]
    when 'fifth'
      then result = weekday_dates[4] if weekday_dates[4]
    when 'last'
      then result = weekday_dates.last
    when 'teenth'
      then result = weekday_dates.select { |date| date > 12 && date < 20 }
    end

    result
  end
end

meetup = Meetup.new(2015, 4)
p Date.civil(2015, 4, 23)
p meetup.day('Thursday', 'fourth')