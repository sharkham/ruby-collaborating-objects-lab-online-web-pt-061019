class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    @songs << song_name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_by_name(artist_name)
    test = Artist.new(artist_name)
    @@all << test
    test
  end

  def self.find_by_name(artist_name)
    found = nil
    @@all.each do |artist|
      if artist.name == artist_name
        found = artist
      else
      end
    end
    found
  end

  def self.find_or_create_by_name(artist_name)
    if self.find_by_name(artist_name)
      self.find_by_name(artist_name)
    else
      self.create_by_name(artist_name)
    end
  end

  #Shorter version from study group:
  # def self.find_or_create_by_name(artist_name)
  #   (my_artist = self.all.find {|artist| artist.name == artist_name}) ? my_artist : self.new(name)
  # end

  #Another shorter version (basically the || means do the first thing, if it's falsey, do the next thing)
  # def self.find_or_create_by_name(artist_name)
  #   self.all.find {|artist| artist.name == artist_name} || self.new(name)
  # end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
