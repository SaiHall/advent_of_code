require 'pry'

class RockPaperScissors

  attr_reader :play_pat

  def initialize(file_loc)
    @play_pat = format_play_pat(file_loc)
  end

  def format_play_pat(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n")
  end
end