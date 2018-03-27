<<<<<<< HEAD
require 'pry'

class Genre
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

  def add_song(song)
    @genre = genre unless song.genre
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    songs.collect(&:artist).uniq
=======
class Genre
  attr_accessor :genre

  def initialize(genre)
    @genre = genre
>>>>>>> 04c211a3e208c4ea90b503a336eca4a22b52d4b0
  end
end
