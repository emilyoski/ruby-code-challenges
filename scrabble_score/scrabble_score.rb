=begin

Requirements:
-program when given a word, computes the scrabble score for that word
-scoring is:
(A E I O U L N R S T) 1
(D G) 2
(B C M P) 3
(F H V W Y) 4
(K) 5
(J X) 8
(Q Z) 10

Examples/Test Cases:
CABBAGE -> 14

-Sum the values of all the letters (tiles) used in the word
-Scrabble class (string as argument/word play or nil)
-#score instance method (no argument)
-#score returns an integer
-#score is case insensitive

Data Structure:
constant of letter values?

class Scrabble
  -accepts an argument as the word played

-#score instance method
  -return 0 if the word is nil or doesn't contain letters
  -downcase the word and separate into character
  -iterate through the characters,
    -replace the letter with the score
    -(not used) determine if the character is matched with those letters
    -find which key contains that letter and
      return the value associated with key
  -sum the array of scores

-#score class method
  -accepts a str as the word to score

=end

class Scrabble
  LETTER_VALUES = { ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
                    ['d', 'g'] => 2, ['b', 'c', 'm', 'p'] => 3,
                    ['f', 'h', 'v', 'w', 'y'] => 4, ['k'] => 5,
                    ['j', 'x'] => 8, ['q', 'z'] => 10 }

  def initialize(word_played)
    @word = word_played
  end

  def score
    Scrabble.score(@word)
  end

  def self.score(str)
    return 0 if str.nil? || !(str.match?(/[a-z]+/i))
    str.chars.map { |char| find_letter_value(char.downcase) }.sum
  end

  def self.find_letter_value(char)
    LETTER_VALUES.each do |key, value|
      return value if key.include?(char)
    end
  end
end
