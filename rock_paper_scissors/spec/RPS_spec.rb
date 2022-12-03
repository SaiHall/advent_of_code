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
  end
end


