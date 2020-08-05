require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find { |ele| ele.name == name }
  end

  def self.find_or_create_by_name(name)
    song_check = self.find_by_name(name)
    return song_check if song_check != nil
    self.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by { |ele| ele.name }
  end

  def self.new_from_filename(str)
    str = str[0..-5]
    arr = str.split(" - ")
    #artist,song
    song = Song.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(str)
    str = str[0..-5]
    arr = str.split(" - ")
    #artist,song
    song = Song.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
