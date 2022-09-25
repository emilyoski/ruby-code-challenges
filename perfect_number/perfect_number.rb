=begin

Requirements:
-program to identify whether a number is: perfect, abundant
  or deficient
-Aliquot sum is the sum of a number's positive divisors
-Positive divisor is number that can be evenly divided into the
  target number with no remainder (excluding the number itself)
-Classification:
  -Perfect means Aliquot sum equal to the number
  -Abundant means Aliquot sum greater than the number
  -Deficient means Aliquot sum less than the number

Examples:
-Divisors include 1 but not the original number
-class PerfectNumber
-::classify class method
-accepts a number
-number needs to be positive
-natural number (1 or above)
-StandardError for the creation of non-natural numbers
-::classify class method must return the classification as string

Data Structure:

class PerfectNumber

classify class method
-accepts an argument of a number
-raise StandardError for any non-natural number ( < 1 )
-return a string of classification type

Algorithm:
classify class method:
-accept an argument
-raise StandardError if the argument is less than 1
-return perfect if perfect_number?
-return abundant if abundant_number?
-return deficient otherwise

-perfect_number? method
-determine the divisors
-compare the original number equal to the divisors sum

-abundant_number? method
-determine the divisors
-compare if the original number less than divisors sum

-divisors method
-initialize an empty array for divisors
-iterate from 1 up to the original number(not including)
  -keep that number if original number equally divisible by num

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    return 'perfect' if perfect_number?(number)
    return 'abundant' if abundant_number?(number)
    'deficient'
  end

  def self.perfect_number?(value)
    value == find_divisors(value).sum
  end

  def self.abundant_number?(value)
    value < find_divisors(value).sum
  end

  def self.find_divisors(value)
    (1...value).to_a.select { |num| value % num == 0 }
  end
end
