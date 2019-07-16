require 'pry'

class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files #this is the reader for files, can be accessed w/instance.files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}
    #Dir.children(path) or Dir.children(self.path) can substitute in for
    #Dir.glob("#{path}/*.mp3"). .children gets rid of the path already/shows
    #the children under that path. 
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
