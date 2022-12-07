require 'pry'

class DataStreamDecoder

  attr_reader :stream
  def initialize
    @stream = []
  end

  def read_signal(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    @stream = file_data.chars
  end
end