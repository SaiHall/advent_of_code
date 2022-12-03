require 'pry'

class RockPaperScissors

  attr_reader :play_pat, :player_two_score

  def initialize(file_loc)
    @play_pat = format_play_pat(file_loc)
    @player_two_score = 0
  end

  def format_play_pat(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n")
  end

  def player_two_score_tally
    @play_pat.each do |string|
      if string[0] == "A"
        @player_two_score += 4 if string[2] == "X"
        @player_two_score += 8 if string[2] == "Y"
        @player_two_score += 3 if string[2] == "Z"
      elsif string[0] == "B"
        @player_two_score += 1 if string[2] == "X"
        @player_two_score += 5 if string[2] == "Y"
        @player_two_score += 9 if string[2] == "Z"
      else
        @player_two_score += 7 if string[2] == "X"
        @player_two_score += 2 if string[2] == "Y"
        @player_two_score += 6 if string[2] == "Z"
      end
    end
  end

  def player_two_proper_tally
    @play_pat.each do |string|
      if string[0] == "A"
        @player_two_score += 3 if string[2] == "X"
        @player_two_score += 4 if string[2] == "Y"
        @player_two_score += 8 if string[2] == "Z"
      elsif string[0] == "B"
        @player_two_score += 1 if string[2] == "X"
        @player_two_score += 5 if string[2] == "Y"
        @player_two_score += 9 if string[2] == "Z"
      else
        @player_two_score += 2 if string[2] == "X"
        @player_two_score += 6 if string[2] == "Y"
        @player_two_score += 7 if string[2] == "Z"
      end
    end
  end
end