<<<<<<< HEAD
require 'pry'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Can be abstracted into a module
    @@all
  end

  def self.destroy_all # Can be abstracted into a module
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap(&:save)
  end

  # Had trouble here.
  # Original code had issues with:
    # def add_song(song)
    #   songs << song unless songs.include?(song)
    # end
  # Also see Song#artist=
    # if artist
      #   @artist = artist
      #   artist.add_song(self)
      # end
# Was failing test: expect(song.artist).to be(artist)
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres # returns genres > eg. [punk, rock]
    songs.collect(&:genre).uniq
  end
end
=======
class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end



# Should have a name
#
# Must record @@all instances of the class - accessible via self.all method
#
# save method should put instances into @@all
#
# self.destroy_all should empty @@all
#
# Custom constructor .create that instantiates an instance but also invokes save method
#
# RELLIES
# songs belong to an Artist and an artist has many songs
#   - Adding a song to an artist is done by calling add_song method on an instance of the Artist class
#   - Songs can be initialized with an optional artist argument
#
# Genres have many songs and are initialized with an empty list of songs
#   - Songs have one genre
#   - Songs can be initialized with an optional genre argument
#
# Artists have many genres through their songs. Use genres method for this association
# Genres have many artists through their songs. Use artists method for this association
#
# If call Song.new("Song Title", artist_object, genre_object), both Song.artist= and Song.genre= should be invoked
# If call Song.new("This song has no artist or grenre"), neither Song.artist= nor Song.genre should be invoked.
#
# Songs should have a find_by_name method
# Songs should have a find_or_create_by_name method
>>>>>>> 04c211a3e208c4ea90b503a336eca4a22b52d4b0
