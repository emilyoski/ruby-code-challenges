=begin

Requirements:

-calculate the Hamming distance between two DNA strands
-Hamming distance = counting the differences between 2 strands
-need to be equal length sequences
-use the shorter length strand if unequal length sequences

Examples/Test Cases:

-DNA class for the creation of one strand (argument)
  -should be able to take an empty strand/string
- #hamming_distance instance method which takes a different strand (string)
    -hamming distance should be able to take an empty strand/string
    -comparison should be based on the position (same position comparison)
    -should return an integer indicating the differences (hamming distance)
    -should only compare the shorter length if unequal lengths
    -the shorter length might be from the DNA class OR the passed in DNA strand
    -do not mutate the original DNA strand

Data Structure:

class DNA
  -argument for the DNA strand when initializing (string)
  -should not mutate the DNA strand when calculating the hamming distance

#hamming_distance instance method
  -accept a string as the other strand
  -return an integer showing the hamming distance
  -needs to take the shorter length (if they are different lengths) OR
  take the first DNA strands
  -compare the differences between the two strands (hamming distance)
  -cannot mutate the DNA strand

Algorithm:

#hamming distance instance method
-initialize a count to 0
-determine which strands is shorted
-set that strand to the comparison "standard"
-determine if we are using the DNA strand (standard strand passed)
-if we are using the DNA strand,
  -iterate through the DNA strand with the index
  -if that element is equal to the element at that index in the other string,
    increment the count by 1
-return the count

#determine shortest strand
  -if the length of the DNA < length of other strand
    return the DNA strand
  -if the length of the other strand < length of DNA strand
    return the other strand
  -otherwise
    return the DNA strand

# determine if we are using the DNA strand
  -if the strand is the same as the DNA strand
    return true
  -false

=end

class DNA
  attr_reader :dna

  def initialize(strand)
    @dna = strand
  end

  def hamming_distance(test_strand)
    count = 0
    standard = determine_shortest_strand(test_strand)
    comparison = using_dna_strand?(standard) ? test_strand : dna

    standard.chars.each_with_index do |ele, idx|
      count += 1 if ele != comparison.chars[idx]
    end

    count
  end

  private

  def determine_shortest_strand(other)
    dna.length <= other.length ? dna : other
  end

  def using_dna_strand?(strand)
    dna == strand
  end
end
