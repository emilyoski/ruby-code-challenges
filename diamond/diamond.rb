=begin

Requirements:
-Takes an input letter
-outputs a diamond shape
-given a letter, it prints a diamond starting with 'A' with
  the supplied letter at the widest point
-first row contains one 'A'
-last row contains one 'A'
-all rows (except the first and last) have exactly two identical letters
-diamond is horizontally symmetric
-diamond is vertically symmetric
-diamond has a square shape (width equals height)
-letters form a diamond shape
-top half has the letters in ascending order
-bottom half has the letters in descending order
-four corners (containing the spaces) are triangles

Examples/Test Cases:
-length of the string(width) equals the number of rows (height)
-first and last row have (total number of rows - 1) spaces
  -same # of spaces on either side of letter
-rest of rows have (total number of rows - 2) spaces
  -same # of spaces on left side of first letter
    and right side of second letter
  -starting with 1 and adding by 2 for spaces in middle between letters
-always will be an odd number of rows
-newline following each line/row

Data Structure:

class Diamond

alphabet constant
-create an alphabet of uppercase letters in an array

@spaces_side (#rows / 2)
@spaces_middle
@diamond

#make_diamond class method
  -accepts an argument of a letter
  -produces a diamond using alphabetical letters
  -diamond must be a square with letters/spaces

Algorithm:
#alphabet constant

#reset class variables
  @@diamond = empty string
  @@spaces_side = (appropriate first spaces on side)
  @@spaces_middle = 1

#make_diamond class method
  -reset class variables
  -set_spaces_side(index of letter is spaces_side)
  -0 up to (idx letter - 1)
    one_character line added to @diamond if num is 0
    two_character line added otherwise to @diamond
    increment space_sides (down 1)
    increment space_middle if the num is not 0 (up 2)

  -(idx letter) down to 0
    one_character line added to @diamond if num is 0
    two_character line added otherwise to @diamond
    increment space_sides (up 1)
    increment space_middle if the num is not 0 (down 2)

#one_character line
  -empty string
  -add space * @spaces_side
  -add letter idx 0
  -add spaces * @spaces_side
  -return string

#two_character line
  -empty string
  -add space * @spaces_side
  -add letter idx
  -add space * @spaces_middle
  -add letter idx
  -add spaces * @spaces_side
  -return string

=end

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.reset_diamond(letter)
    @@shape = ""
    @@space_side = ALPHABET.index(letter)
    @@space_middle = 1
  end

  def self.make_diamond(letter)
    reset_diamond(letter)
    0.upto(ALPHABET.index(letter) - 1) do |idx|
      @@shape << char_line(idx)
      increment_spaces_up(idx)
    end

    (ALPHABET.index(letter)).downto(0) do |idx|
      @@shape << char_line(idx)
      increment_spaces_down(idx)
    end
    @@shape
  end

  def self.char_line(index)
    line = (" " * @@space_side)
    line << ALPHABET[index]
    line << (" " * @@space_middle) if index != 0
    line << ALPHABET[index] if index != 0
    line << (" " * @@space_side)
    line << "\n"
  end

  def self.increment_spaces_up(index)
    @@space_side -= 1
    @@space_middle += 2 if index != 0
  end

  def self.increment_spaces_down(index)
    @@space_side += 1
    @@space_middle -= 2 if index != 0
  end
end
