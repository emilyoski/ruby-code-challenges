=begin

Requirements:
-program that takes a word and a list of possible anagrams and
  selects the correct sublist that contains the anagrams of the word

Examples/Test Cases:
For example, given the word "listen" and a list of candidates 
  like "enlists", "google", "inlets", and "banana", 
  the program should return a list containing "inlets". 

-no double letters of the sample word to create the anagram
-return an empty array if there are no anagrams in the possible anagrams list
-must use all the letters in the anagram
-a duplicate word is not a correct anagram
-Anagram class; #match instance method
-match instance method should return an array
-anagrams are case insensitive

Data Structure:
class Anagram 
  -accepts a word as an argument

#match instance method
-must return an array object
-include proper anagram 
  -case insensitive
  -use all letters exactly once
  -cannot be the same word 

Algorithm:

#match instance method (accept an array of strings)
-initialize an anagrams array (empty)
-iterate through array of options
  -if the word is an anagram then add it to the anagrams array
-return the anagrams array

#anagrams?
-downcase the "word" and sort the letters
-compare this to the downcase/sorted word (potential anagram word)
-ensure that they are not the same word

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(potential_anagrams)
    anagrams = []
    potential_anagrams.each do |test_word|
      anagrams << test_word if anagram?(test_word)
    end
    anagrams
  end

  private

  def anagram?(str)
    (@word.downcase != str.downcase) && 
    (@word.downcase.chars.sort.join == str.downcase.chars.sort.join)
  end
end