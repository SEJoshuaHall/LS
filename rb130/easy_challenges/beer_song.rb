=begin

PROBLEM
Write program to generate lyrics of song.


=end

class BeerSong
  def self.verse(verse)
    if verse == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{verse} bottle#{verse > 1 ? 's' : ''} of beer on the wall, #{verse} bottle#{verse > 1 ? 's' : ''} of beer.\n" \
      "Take #{verse == 1 ? 'it' : 'one'} down and pass it around, #{verse - 1 == 0 ? 'no more' : verse - 1} bottle#{(verse - 1) == 1 ? '' : 's'} of beer on the wall.\n"
    end
  end

  def self.verses(start, finish)
    output = (finish..start).to_a.reverse.map {|verse| self.verse(verse) }
    output.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end
end
