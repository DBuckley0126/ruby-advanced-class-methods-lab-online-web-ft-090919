require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    obj = self.new
    obj.save
    obj
  end

  def self.new_by_name (arg)
    obj = self.new
    obj.name = arg
    obj
  end

  def self.create_by_name (arg)
    obj = self.new
    obj.name = arg
    obj.save
    obj
  end

  def self.find_by_name (arg)
    self.all.find {|obj| obj.name == arg}
  end

  def self.find_or_create_by_name (arg)
    if self.find_by_name (arg)
       self.find_by_name (arg)
     else
       self.create_by_name (arg)
     end
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename (arg)
    obj = self.new
    artis_name = arg.match(/\b[^"-]*/)
    song_name = arg.match(/- [a-zA-Z\s]+/)
    #binding.pry
    @artist_name = artis_name[0..-2]
    Song.name = song_name[2..-1]

  end

  def save
    self.class.all << self
  end


end
#
