=begin

  def determine_correct_date(weekday, meetup)
    first option
    case weekday
    when 'monday' then meetup.monday?
    when 'tuesday' then meetup.tuesday?
    when 'wednesday' then meetup.wednesday?
    when 'thursday' then meetup.thursday?
    when 'friday' then meetup.friday?
    when 'saturday' then meetup.saturday?
    when 'sunday' then meetup.sunday?
    end
    second option
    return meetup if monday?(weekday) && meetup.monday?
    return meetup if tuesday?(weekday) && meetup.tuesday?
    return meetup if wednesday?(weekday) && meetup.wednesday?
    return meetup if thursday?(weekday) && meetup.thursday?
    return meetup if friday?(weekday) && meetup.friday?
    return meetup if saturday?(weekday) && meetup.saturday?
    return meetup if sunday?(weekday) && meetup.sunday?
  end

  example method for second option:
  def monday?(weekday)
    weekday.downcase == 'monday'
  end

Requirements:
-meetups typically happen monthly on the same day of the week
-we'll construct objects that represent a meetup date
-each object takes a month number (1-12) and a year (2021)
-object should be able to determine the exact date of the meeting
  in the specified month and year
-descriptors given as strings: first, second, third, fourth, fifth,
  last, teenth (case insensitive)
-teenth -> exactly 7 days that end in 'teenth' therefore its guaranteed
  that each day of the week (M, T, W..) will have exactly one date that is
  the "teenth" of that day in every month (every month has a Monday teenth,
  a Tuesday teenth..) the fifth day of the month may not happen every month

Examples:
-if you ask for the 2nd Wednesday of May 2021,
  the object should be able to determine that
  the meetup for that month will occur on the 12th of May, 2021.

-define a class Meetup with a constructor taking a month and a year
-#day method (weekday, schedule) where
  weekday is one of: monday, tuesday, wednesday, etc.
  schedule is: first, second, third, fourth, fifth, last or teenth
-#day method returns the date (== to Date.civil(2013,10,6))
-return nil if there is not a date that day (fifth wednesday, etc)
-case insensitive for arguments (day method)

Data Structure:
class Meetup
  -accepts the (year, month)

-#day instance method
  -accepts (weekday, schedule)
  -returns the date when that meetup will occur

Algorithm:
#day instance method
-downcase/standardize the weekday and schedule
-First start with the schedule and determine the range of dates (helper)
  -first: 1-7
  -second: 8-14
  -third: 15-21
  -fourth: 22-28
  -fifth: 29-31
  -last: (last day of month - 6) - (last day of month) (could be another helper)
    -last day of month will depend on the month
  -teenth: 13-19
-Iterate through the range of potential dates
  -find the date that is the weekday given
  -return that date
-Return nil if no date is found

=end

require 'date'

class Meetup
  DATE_RANGES = { 'first' => (1..7), 'second' => (8..14), 'third' => (15..21),
                  'fourth' => (22..28), 'fifth' => (29..31),
                  'teenth' => (13..19) }

  def initialize(year, month)
    @year = year
    @month = month
    @meetup = nil
  end

  def day(weekday, schedule)
    date_range(schedule).each do |date|
      next if !Date.valid_date?(@year, @month, date)
      if date_correct?(weekday, Date.new(@year, @month, date))
        @meetup = Date.new(@year, @month, date)
      end
      return @meetup if meetup_found?
    end
    @meetup
  end

  def date_correct?(weekday, meetup)
    meetup.send (weekday.downcase + '?').to_sym
  end

  def meetup_found?
    @meetup
  end

  def date_range(week)
    if DATE_RANGES.keys.include?(week.downcase)
      return DATE_RANGES[week.downcase]
    end
    last_week_range
  end

  def last_week_range
    if @month.to_s.match?(/([13578]|10|12)/)
      (25..31)
    elsif @month.to_s.match?(/([469]|11)/)
      (24..30)
    elsif Date.new(@year).leap?
      (23..29)
    else
      (22..28)
    end
  end
end
