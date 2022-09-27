=begin

Requirements:
-program that can generate the lyrics of 99 Bottles of Beer song

Example/Test Cases:
-BeerSong class
-#verse class method that takes one or two arguments
-arguments represents "how many bottles of beer" on the wall
-multiple arguments like (2, 0) would represent the verses from 2 bottles
  down to 0 bottles (range, not just those two verses)
#lyrics class method produces the entire song (99-0)

Verse is two lines:

99 bottles of beer on the wall, 99 bottles of beer.(\n)
Take one down and pass it around, 98 bottles of beer on the wall.(\n)

Differences occur in lyrics for 1 bottle left: (1 bottle vice 2 bottles)

1 bottle of beer on the wall, 1 bottle of beer.\n
Take it down and pass it around, no more bottles of beer on the wall.\n

Differences occur in lyrics for no bottles left:

No more bottles of beer on the wall, no more bottles of beer.\n
Go to the store and buy some more, 99 bottles of beer on the wall.\n

-bottle is singular for 1 bottle
-99-2 and 0 are bottles
-1 bottle of beer -> take it down (instead of take one down)
-0 bottles -> "no more"
-second line is "go to the store and buy some more..(rest is same/99 bottles)"

Data Structure:

class BeerSong
  class variable for beers on the wall

#verse class method that takes one or two arguments (single verse or range)
-will output the verses of argument specified

#lyrics class method
-utilize the #verse class method from 99 to 0 verses

Algorithm:
#verse class method
  -accepts either single number (verse) or two numbers (range)
  -set the class variable for beers on the wall to first number
  -create a range from the arguments (first argument down to second argument)
  -iterate through the range and generate a verse for that beers on wall
    -add first line to verse
    -subtract 1 if the bottles of beer is greater than 0; or add 99 to it
    -add second line to verse

-first line generation
  is the bottles of beer equal to 1?
  use string interpolation for # of bottles of beer and the bottle(s)

-second
  -if the "bottle of beer" 1 - 98
    "take one down and pass it around"
  -if the "bottle of beer" 0
    "take it down and pass it around"
  -if the "bottle of beer" 99
    "go to the store and buy some more"

  is the bottles of beer equal to 1?
  use string interpolation for # of bottles of beer and the bottle(s)

=end

class BeerSong
  def self.verse(verse_num)
    song = ''
    @@beers_on_wall = verse_num

    song << generate_first_line
    @@beers_on_wall > 0 ? @@beers_on_wall -= 1 : @@beers_on_wall = 99
    song << generate_second_line

    song
  end

  def self.verses(first_verse, final_verse)
    song = ''

    first_verse.downto(final_verse) do |verse_num|
      song << verse(verse_num)
      song << "\n"
    end

    song.chomp
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.generate_first_line
    "#{bottle_number} #{bottles} of beer on the wall," \
    " #{bottle_number.downcase} #{bottles} of beer.\n"
  end

  def self.generate_second_line
    "#{beer_bottle_action}, " \
    "#{bottle_number.downcase} #{bottles} of beer on the wall.\n"
  end

  def self.bottle_number
    @@beers_on_wall == 0 ? "No more" : @@beers_on_wall.to_s
  end

  def self.bottles
    @@beers_on_wall == 1 ? "bottle" : "bottles"
  end

  def self.beer_bottle_action
    if @@beers_on_wall.zero?
      "Take it down and pass it around"
    elsif (1..98).include?(@@beers_on_wall)
      "Take one down and pass it around"
    elsif @@beers_on_wall == 99
      "Go to the store and buy some more"
    end
  end
end
