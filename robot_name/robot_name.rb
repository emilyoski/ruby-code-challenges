=begin

Requirements:
-program that manages robot factory settings
-when robots come off the factory floor, they have no name
-first time boot up, random name generated (RX837 or BC811)
-reset a robot to its factory settings, name gets wiped
  -will reply with new random name when asked
-names should be random, should not follow predictable sequence
-(there is a risk of collison with random)
-solution should not allow use of the same name twice when avoidable

Examples/Test Cases:
-Robot class
-name getter method
-reset instance method to change the name
-name should be two uppercase letters followed by 3 decimal digits

Data Structure:

class Robot
@name = nil
history of names? array?

#name getter method
-repeat process until the random name is not in the name_history
  -generate name
-sets the name
-adds the name to the name history
-returns the name

#reset instance method
-change the @name to nil

Algorithm:
#generate_random_name
  -initialize a string
  -randomly select a number from 0-25
  -put that alphabetical letter into the string
  -repeat that process twice
  -randomly select number 0-9
  -add to the string
  -repeat that process three times

#name instance method
  -repeat until the name is changed
  -generate a name
  -if that name is in the history of names,
    generate another name
  -stop the loop if the name is not in the history
  -if that name is not in the history of names,
    set the name to that string and add names to history of names

#reset instance method
  -@name to nil

=end

class Robot
  ALPHABET = ('A'..'Z').to_a.reverse
  DIGITS = ['7', '6', '5', '4', '3', '2', '1', '0', '9', '8']
  @@name_history = [] # class variable to keep track of names for all robots

  def initialize
    @name = nil
  end

  def name
    generate_replacement_name if @name.nil?
    @name
  end

  def generate_random_name
    possible_name = ''
    num = Random.new

    2.times { |_| possible_name << ALPHABET.fetch(num.rand(25)) }
    3.times { |_| possible_name << DIGITS.fetch(num.rand(9)) }

    possible_name
  end

  def generate_replacement_name
    random_name = nil

    loop do
      random_name = generate_random_name
      break if !@@name_history.include?(random_name)
    end

    @@name_history << random_name
    @name = random_name
  end

  def reset
    @@name_history.delete(@name) # remove the name from robot names being used
    @name = nil
  end
end
