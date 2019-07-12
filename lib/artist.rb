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

  def print_songs
    @songs.each do |song|
      puts song.name
    end 
  end

end
