=begin

Requirements:
-create a clock that is independent of date
-add to or subtract minutes from time represented by clock object
-two clock objects that represent the same time should be equal
-cannot use date or time functionality
-only use arithmetic operations

Examples/Test Cases:
-class Clock
-#at class method (takes an integer argument, sometimes 2)
  first argument looks to be hours; second minutes
-#to_s instance / (class?) method
  returns a string '08:00' hours:minutes
-#+ class? method (takes an argument)
  add minutes to the time (10 -> 10:03)
  can add more than 60 minutes (61)
  needs to circle around midnight too/days
-#- class? method (takes an argument)
  subtracts minutes from current time (midnight -> 23:10)
-military time
-#== instance method
  comparing clocks (true if time is the same)

Data Structure:

class Clock
#at class method
  -takes 1-2 arguments (hours, minutes)
  -military time
  -could return instance of the clock class?

#to_s method
  -string '08:00' hours:minutes
  -format in the correct two digit output

#+ method
  -takes one argument (minutes)
  -can add minutes (minutes for hours; days)

#- method
  -takes one argument (minutes)
  -subtract minutes (can be hours; days, etc)

#== method
  -comparing clocks and time

Algorithm:

#to_s method
-need to format each hour and minute as 2 decimals

#+ method (change_minutes)
-change_minutes is less (60 minutes - current_minutes)
  -just add the time to the minutes
-1) find (60 minutes - current_minutes)
  -subtract that from the change_minutes
  -reset the minutes to 0
-2) divide the change_minutes / 60 min
  -find the amount of hours -> change hours
  -add the change hours to hours
  -if the hours is 24 or above, subtract 24 from hours
-3) remainder of change_minutes / 60 min
  -change the minutes to that remainder

#- method
-if the change_minutes is less than or equal to current minutes
  -subtract the change_minutes from the current minutes
-otherwise
  if the current_minutes are not 0
    -subtract current_minutes from the change_minutes
    -zeroize the minutes
    -shift the hour back by 1
  -determine hours changed = change_minutes / 60
  -determine minutes changed = change_minutes % 60
  -subtract hours
  -subtract the minutes (60 - minutes is now minutes)
  -subtract another hour
  -repeat until hour is between 0 - 23, (add 24 to hours)

=end

class Clock
  MIN_PER_HOUR = 60
  HOURS_PER_DAY = 24
  attr_accessor :hour, :minute

  def initialize(hour, minutes)
    @hour = hour
    @minute = minutes
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def +(change)
    if change <= (MIN_PER_HOUR - minute)
      self.minute += change
      zeroize_minutes if minute == 60
    else
      self.hour += hour_changes(change)
      self.minute += minute_changes(change)
      reset_days
    end
    self
  end

  def -(change)
    if change <= minute
      self.minute -= change
    else
      if minute != 0 # decrease to the hour
        change -= minute
        zeroize_minutes
      end
      self.hour -= hour_changes(change)
      self.minute = (MIN_PER_HOUR - (minute_changes(change)))
      increment_hour_by { -1 }
      reset_days
    end
    self
  end

  def to_s
    "#{format('%02d', hour)}:#{format('%02d', minute)}"
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end

  def hour_changes(change)
    change / MIN_PER_HOUR
  end

  def minute_changes(change)
    change % MIN_PER_HOUR
  end

  def increment_hour_by
    self.hour += yield
  end

  def zeroize_minutes
    self.minute = 0
  end

  def reset_days
    loop do
      self.hour -= HOURS_PER_DAY if hour >= HOURS_PER_DAY
      self.hour += HOURS_PER_DAY if hour < 0
      break if (0...HOURS_PER_DAY).include?(hour)
    end
  end
end
