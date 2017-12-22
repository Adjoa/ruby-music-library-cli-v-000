class Song
  @@all = []

  attr_accessor :name
  attr_reader :artist

  def initialize(name, artist=nil)
    @name = name
    self.artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end
end
