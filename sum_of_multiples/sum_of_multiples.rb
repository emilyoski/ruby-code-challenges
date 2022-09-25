=begin

Requirements:
-given a natural number and a set (consisting of 1 or more other numbers)
-find the sum of all the multiples of the numbers in the set
-multiples are less than the first number (natural number)
-if the set of numbers are not given, use default set of 3 and 5

Examples/Test Cases:
-natural number 20
-no set given so we use 3 & 5
-multiples are: [3 5 6 9 10 12 15 18] -> sum is 78

-class SumOfMultiples

-#to class method
  -accepts a number as an argument
  -looking for multiples from 1 up to that natural number (allowed multiples of set given)

-constructor/initialize with a set of numbers
  -arguments vary from 2-3, no set number of arguments
  -set is given in the constructor 

-#to instance method as well
  -does the same thing as the class method 

Data Structure:

class SumOfMultiples
  
#initalize method 
  -accepts multiple arguments (*numbers)
  -forms the set 

#to class method
  -initialize an instance of the class
  -pass 3 and 5 as the "set" and utilize the #to instance method

#to instance method
  -accepts the natural number "upper limit on multiples, not including"
  -determine the multiples in that range; multiples of the numbers in the set
  -sum the multiples

Algorithm:
#to instance method(accepts natural number as upper limit)
-Initialize an empty array for multiples
-Iterate through the "set" [3 5]
  -for that multiple (3 here)
  while multiple is less than the natural number
    add the multiple to the multiples_array if the range includes that multiple
    increment the multiple by the "original multiple (3)"
-sum the multiples array and return it
***cannot count multiples twice -> uniq then return the sum

=end

class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = set
  end

  def self.to(upper_limit)
    SumOfMultiples.new(3,5).to(upper_limit)
  end

  def to(upper_limit)
    all_multiples = []

    set.each do |set_num|
      multiple = set_num

      while multiple < upper_limit do
        all_multiples << multiple if (1...upper_limit).include?(multiple)
        multiple += set_num
      end
    end

    all_multiples.uniq.sum
  end
end

