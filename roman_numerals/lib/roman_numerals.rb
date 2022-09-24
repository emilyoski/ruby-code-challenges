=begin

Requirements:
-convert decimal numbers into their roman number equivalents
-letters for roman numbers: 
    I (1), V (5), X (10), L (50), C (100), D (500), M (1000) 
-max number is 3000
-roman numeral is each digit expressed separately starting from the left and
  ignoring all the zeros
-cannot have a zero

Examples/Test Cases:
-RomanNumeral class which accepts a decimal number as an argument
-#to_roman instance method that converts the number into the roman number
-doesn't appear to have any validation that number is between 1-3000 

Data Structure:

class RomanNumeral 
  decimal number as the argument, state of RN class

#to_roman instance method 
  converts the decimal number to the roman number equivalent

Algorithm:

#to_roman instance method
-decimal digits: Break down the decimal number to every digit with place value
-iterate through the decimal digits breakdowns, convert the number to roman numerals
-join the roman numerals together


#decimal_digits
  -take the decimal number, break into digits and reverse (448 -> [8 4 4])
  -initialize a variable, place to 1
  -iterate through the digits array
    -multiple the digit by the place
    -multiple the place by 10
    (should end with [8 40 400])
  -reverse the array and return it

-#convert decimal to roman
  - use a range to determine what the "possible" roman numerals used are
    1 - 9: [I V X]
    10 - 90: [X L C]
    100 - 900: [C D M]
    1000 - 3000: [M]
  - using the decimal number and the possible roman numerals, generate the roman numeral
    1 - 3: X times the first element
    4: first element + second element
    5: second element 
    6 - 8: second element + X times the first element
    9: first element + last element
=end

class RomanNumeral
  attr_reader :decimal_number

  def initialize(decimal)
    @decimal_number = decimal
  end

  def to_roman
    break_dec_into_digits.map! { |num| convert_dec_roman(num) }.join
  end

  def break_dec_into_digits
    dec_num_digits = decimal_number.digits
    place = 1

    dec_num_digits.map! do |num|
      num *= place
      place *= 10
      num
    end

    dec_num_digits.reverse
  end

  def convert_dec_roman(value)
    generate_roman_numeral(value, determine_roman_range(value))
  end

  def determine_roman_range(value)
    case value
    when (1..9) then ['I', 'V', 'X']
    when (10..90) then ['X', 'L', 'C']
    when (100..900) then ['C', 'D', 'M']
    when (1000..3000) then ['M']
    end
  end

  def generate_roman_numeral(value, roman_range)
    first_digit = value.digits[-1]
    case first_digit
    when (1..3) then roman_range[0] * first_digit
    when 4 then roman_range[0] + roman_range[1]
    when 5 then roman_range[1] 
    when (6..8) then roman_range[1] + (roman_range[0] * (first_digit - 5))
    when 9 then roman_range[0] + roman_range[2]
    end
  end
end


