class Artist
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
    unless song.artist
      song.artist = self
      @songs << song
    end
  end
end


# artist.add_song(artist) # Adds artist to a song
