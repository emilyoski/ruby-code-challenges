=begin

Requirements(input/output):

-Determine whether a triangle is equilateral, isosceles or scalene
-Equilateral has all 3 sides of same length
-Isosceles has 2 sides of same length
-Scalene triangle has all sides of different lengths
-Must be a triangle
  -all side lengths must be greater than 0
  -sum of any 2 side lengths must be greater than the
  length of the 3rd side

Examples/Test Cases:

-class of Triangle (input of side lengths, 3 arguments)
    -lengths will be entered in any order
    -input can be floats or integers
- #kind instance method which returns the type of triangle
    -returns the string in all lowercase of type of triangle
-argument error will be raised if triangle doesn't exist
    -0 for the sides
    -negative number given as a side
    -side lengths arent sufficient for an actual triangle

Data Structure:

class Triangle
  -state consisting of the 3 sides
  -kind instance method for returning the type
  -potentially a #triangle? to verify if its a triangle
    inside the state and raise an error preventing you from creating the
    triangle if its not possible

Algorithm:

1) #kind instance method
  -if equilateral triangle, return equilateral
  -if isosceles triangle, return isosceles
  -else then return scalene

2) #triangle? instance method (if this is not true,
need to raise an ArgumentError)
  -Verify all sides are greater than 0
    -Iterate through the sides
    -Verify each side is greater than 0
  -Verify sum of any 2 side lengths must be greater than the length
  of the 3rd side
    -side 1 + side 2 > side3
    -side 2 + side 3 > side1
    -side 3 + side 1 > side2

  3) #equilateral? instance method
    -take the first side, verify all the sides are that side length

  4) #isosceles? instance method
    -Iterate through the side lengths
    -If the count of the side length in the array is 2
      -return true
    -return false if not

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise ArgumentError unless triangle?
  end

  def kind
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    'scalene'
  end

  def triangle?
    sides_valid? && sum_test_valid?
  end

  private

  def sides_valid?
    sides.all? { |side| side > 0 }
  end

  def sum_test_valid?
    sides[0..1].sum > sides[2]
  end

  def equilateral?
    sides.all? { |side| sides[0] == side }
  end

  def isosceles?
    sides.each { |side| return true if sides.count(side) == 2 }
    false
  end

  attr_reader :sides
end
