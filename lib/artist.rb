class Artist
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song
    self.save unless @@all.include?(self)
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  
  
  def self.find_or_create_by_name(artist_name)
    @@all.each do |artist|
      if artist.name == artist_name
        return artist
      end
    end
    
    return self.new(artist_name)
    
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end