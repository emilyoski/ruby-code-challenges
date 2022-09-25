=begin

Requirements:
-convert an octal string to a decimal output 
-invalid input is considered the same as octal 0
-don't use any built in or library methods that perform
  necessary conversions for you

-decimal system; right to left digit gets multipled by 10^0 then 10^1 and so on
-octal system; similar except multipled by 8^0 then 8^1 and so on

Examples/Test Cases:
Decimal: 233
         (2 * 10^2) + (3 * 10^1) + (3 * 10^0) 
         200        + 30         + 3          = 233

Octal:  233
        (2 * 8^2) + (3 * 8^1) + (3 * 8^0) 
        128       +  24       + 3            = 155

converting from octal to decimal!

-Octal class which accepts string
-#to_decimal instance method
  -need to be able to handle larger numbers (1234567, etc)
  -invalid octal is 0 -> 0
  -may be all letters or include letters -> those are invalid
  -number starting with 0 is not invalid (011)
  -octal 9, 6789, 8 are invalid? 
  -octal numbers only utilize 0-7 (anything with 8 or 9 is invalid)

Data Structure:

class Octal(accepts string)

#to_decimal instance method
  -any input not 0-7 is invalid and 0 is returned
  -calculate the decimal number from the string octal given

Algorithm:
#to_decimal
-return 0 if the string has any character not within the range 0-7
-convert the string to an integer and reverse the order "1234" -> [4 3 2 1]
-Initialize a total of 0
-Iterate through the digits [4 3 2 1]
  -Add to the total (digit x 8^(index of digit))
-return the total

=end

class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if octal.match?(/[^0-7]/)
    total = 0

    octal.to_i.digits.each_with_index do |digit, index|
      total += (digit * (8**index))
    end

    total
  end
end