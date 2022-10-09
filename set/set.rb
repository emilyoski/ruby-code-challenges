=begin

Requirements:
-create a custom set type
-behaves like a set of unique elements that
  can be manipulated in several well defined ways
-do not use the Set type
-may assume that all elements of a set must be numbers

Examples/Test Cases:
-CustomSet class
-#empty? instance method checks if there is anything in the set
  -there is nothing if nothing is passed to the set
-constructor can take no arguments or can take an array that contains
  elements for the set
-#contains? instance method that accepts an argument (checking the set for that)
-#subset? instance method checks to see
  if our set is contained in that set passed
  -comparing another instance of CustomSet class
  -needs to contain all the numbers in our set to be a subset
  -empty set counts as a subset
-#disjoint? instance method
  -two empty set are true
  -comparing another instance of the CustomSet class
  -will return true if the elements are different in both sets
-#eql? instance method
  -empty sets are equal
  -comparing another instance of the CustomSet class
  -both sets need to have the same elements
    (do NOT need to be in the same order)
  -doesn't matter if multiples of one number,
    as long as the number is present in the set
-#add instance method
  -can add element as argument to the set
-#== instance method
  -both are CustomSet instances and elements are the same (eql? similiar?)
-#intersection instance method
  -will return a CustomSet instance that contains elements
    that are present in both sets
  -will return an "empty" Set if there are no elements in both
-#difference instance method
  -based on the Set you have, remove any elements in the set that is passed
  -[] -> difference ([] or [3 2 5]) will all return [] because our set is empty
  -[3 2 1] -> difference (2 4) will return [3 1]
    because 2 is not different but 3 and 1 are
-#union instance method
  -add any new elements from the set passed as an argument

Data Structure:
class CustomSet
  #constructor
    -accepts nothing for empty Sets
    -accepts an array containing numbers

  #empty?
    -checks for empty Set

  #contains?
    -argument for number
    -checks to see if Set contains that number

  #subset?
    -argument is instance of CustomSet
    -checks to see if the elements in OUR set,
      exists in the set passed as an argument
    -empty set of ours will exist in the set passed in
    -needs to contain all numbers in our set

  #disjoint?
    -argument is instance of CustomSet
    -verifies that numbers in OUR set, are not in the argument set

  #eql?
    -argument is instance of CustomSet
    -checks to see if numbers in our set exist in the argument set
    -all numbers need to be present
    -do not need to have multiples
    -do not need to be in order

  #add
    -number as argument
    -added to the set

  #==
    -similar to eql?
    -utilize that

  #intersection
    -argument is instance of CustomSet
    -return an instance of CustomSet that contains numbers in both sets
    -return "empty" CustomSet if there is no numbers in both sets

  #difference
    -remove elements from your set if they are in the argument set
    -our set [3 2 1] -> difference (2 4) will return [3 1]

 #union
  -add any new elements from the set passed as an argument

Algorithm:
#subset
-iterate through the elements in our set
-if the element is not contained in the argument set, return false
-otherwise return true

#disjoint
-iterate through our set
-if the element is contained in the argument set, return false
-return true otherwise

#intersection
-instantiate new CustomSet
-iterate through our set
  -if that number is contained in the other set
  -add the number to our new CustomSet
-return the new CustomSet

#difference
-instantiate new CustomSet
-iterate through our set
  -if that number is NOT in the other set
  then add number to new CustomSet
-return the new CustomSet

#union
-iterate through the other set
  -if that element is not in our set, add it
-return self

=end

class CustomSet
  def initialize(arr = [])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.each do |num|
      return false if !other.contains?(num)
    end
    true
  end

  def disjoint?(other)
    set.each do |num|
      return false if other.contains?(num)
    end
    true
  end

  def eql?(other)
    set.sort.uniq == other.set.sort.uniq &&
      other.instance_of?(CustomSet)
  end

  def add(num)
    @set << num
    self
  end

  def ==(other)
    set.sort.uniq == other.set.sort.uniq
  end

  def intersection(other)
    new_set = CustomSet.new
    set.each do |num|
      new_set.add(num) if other.contains?(num)
    end
    new_set
  end

  def difference(other)
    new_set = CustomSet.new
    set.each do |num|
      new_set.add(num) if !other.contains?(num)
    end
    new_set
  end

  def union(other)
    other.set.each do |num|
      add(num) if !set.include?(num)
    end
    self
  end

  protected

  attr_reader :set
end
