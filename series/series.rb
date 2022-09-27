=begin

Requirements:
-Take string of digits and return all possible consecutive number series
  of a specified length in that string
-Asking for a series of longer length than you have digits, gives an error
-series appear to be in the same order as the digits in the string

Examples/Test Cases:
String "01234" has the following 3 digit series: 012, 123, 234
String "01234" has the following 4 digit series: 0123, 1234

-Series class with string digits as argument
-Create the possible consecutive number series;
  array with subarray of each possible consecutive number series
-#slices instance method that gives the specified length of the cons. series
-raise Argument Error if the specified length is too long
  (needs to be the same length)

Data Structure:
class Series
  -accept an argument as the string

#slices instance method
  -raises ArgumentError if slice length is longer than string
  -accepts an argument as the slice length
  -output an array
    -each possible consecutive number series is subarray in array
    -all numbers are integers in the subarray

Algorithm:
#slices instance method
-raise ArgumentError if slice_length is longer than string_length
-break the string into characters
-initialize an overall array of possible consecutive number series
-iterate from index 0 to index (string_length - slice_length)
  -slice the characters array; from index for appropriate slice_length digits
  -convert all the characters to integers
  -add this subarr to overall array of possible consecutive number series

=end

class Series
  attr_reader :number

  def initialize(number)
    @number = number.chars
  end

  def slices(slice_length)
    raise ArgumentError, "slice length too long" if slice_length > number.length
    all_consec_series = []

    0.upto(number.length - slice_length) do |index|
      all_consec_series << number.slice(index, slice_length).map(&:to_i)
    end

    all_consec_series
  end
end
