class Song
  # attr_reader abstracting the code so you dont have to write a "reader"  (getter) you could type all of this out below with methods, but this looks cleaner
  attr_reader :name, :artist, :genre
  # in this "instance" before "initialization" there arent any albums that exist
  @@count = 0
  # stores all artists
  @@artists = []
  # stores all genres
  @@genres = []
  #initialize the class here, define the "instance variables", set the counter to increase by 1 as an album is added. Add all genres to the @@genres array, add all artists to @@artists array
  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists << artist
  end
  #this makes the "class variable"(@@count) accessible through a method. Notice in the beginning that it is set to = 0 and it increments += 1. This just keeps track of how many songs are created. (self.count) is the class method which will return this number when called
  def self.count
    @@count
  end
  #this "class method" (self.artist)(class methods act on themselves (.self), calls the class variable( @@artists) which is an array that only wants to retain elements without duplicates "(.uniq)"
  def self.artists
    @@artists.uniq
  end
  # same as above except with genres
  def self.genres
    @@genres.uniq
  end
 # this class method (self.genre.count) iterates over the class variable (@@genres) and basically counts the number of songs in each genre. Set up an empty hash to collect the values, then .count the class variable to see how many of each song exists in there. then return the hash
  def self.genre_count
    genre_hash = {}
    self.genres.each do |genre|
      genre_hash[genre] = @@genres.count {|g| g == genre}
    end
    genre_hash
  end
  #same as above but does it with artists
  def self.artist_count
    artist_hash = {}
    self.artists.each do |artist|
      artist_hash[artist] = @@artists.count {|a| a == artist}
    end
    artist_hash
  end
end






