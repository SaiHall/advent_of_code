require 'pry'
require 'Rspec'
require_relative '../lib/RPS'

describe RockPaperScissors do
  it 'exists' do
    game = RockPaperScissors.new("./rock_paper_scissors/test_rps_pattern.txt")
    expect(game).to be_an_instance_of(RockPaperScissors)
  end

  it 'can format a play pattern' do
    game = RockPaperScissors.new("./rock_paper_scissors/test_rps_pattern.txt")
    expect(game.play_pat).to be_an(Array)
    expect(game.play_pat.count).to eq(3)
  end

  it 'can tally player 2s score' do
    game = RockPaperScissors.new("./rock_paper_scissors/test_rps_pattern.txt")
    game.player_two_score_tally
    expect(game.player_two_score).to eq(15)
  end

  it 'can tally player 2 score from bigger file' do
    game = RockPaperScissors.new("./rock_paper_scissors/rps_pattern.txt")
    game.player_two_score_tally
    expect(game.player_two_score).to eq(8392)
  end

  it 'can tally with proper information' do
    game = RockPaperScissors.new("./rock_paper_scissors/test_rps_pattern.txt")
    game.player_two_proper_tally
    expect(game.player_two_score).to eq(12)
  end

  it 'can tally with proper information, from bigger file' do
    game = RockPaperScissors.new("./rock_paper_scissors/rps_pattern.txt")
    game.player_two_proper_tally
    expect(game.player_two_score).to eq(10116)
  end
end


