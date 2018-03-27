<<<<<<< HEAD
require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name) # Custom constructor
    self.new(name).tap(&:save)
  end

  # Had trouble here.
  # Original code had issues with:
    # if artist
    #   @artist = artist
    #   artist.add_song(self)
    # end
  # Also see Artist#add_song
  # def add_song(song)
  #   songs << song unless songs.include?(song)
  # end
  # Was failing test: expect(song.artist).to be(artist)
  def artist=(artist)
      @artist = artist #originally thought this would assign song.artist = artist object
      artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name, artist = nil, genre = nil)
    find_by_name(name) ? find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename) #instantiates new song object from filename  
    file_array = filename.split(" - ")
    name = file_array[1]
    artist = Artist.find_or_create_by_name(file_array[0])
    genre = Genre.find_or_create_by_name(file_array[2].chomp(".mp3"))

    new(name, artist, genre)
  end

  def self.create_from_filename(filename) #instantiates and saves song object from filename
    self.new_from_filename(filename).tap(&:save)
  end
end
=======
class Song
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
>>>>>>> 04c211a3e208c4ea90b503a336eca4a22b52d4b0
