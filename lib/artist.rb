class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name}
  end

  def self.create(name) # .tap yields self to the block, and returns self
    self.new(name).tap {|artist| artist.save} #.save puts the artist into the @@all array
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

end
