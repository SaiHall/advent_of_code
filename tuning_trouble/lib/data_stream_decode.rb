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

   def attempt_char_count #for finding chars until start of packet
    count = 4
    @stream.each_cons(4) do |block|
      count += 1 if block.uniq.length != 4
      return count if block.uniq.length == 4
    end
  end

  def attempt_char_count_message #for finding chars until start of message
    count = 14
    @stream.each_cons(14) do |block|
      count += 1 if block.uniq.length != 14
      return count if block.uniq.length == 14
    end
  end
end