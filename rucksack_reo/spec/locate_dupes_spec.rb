require 'pry'
require 'Rspec'
require_relative '../lib/locate_dupes'

describe RucksackReo do
  it 'exists and has attributes' do
    bags = RucksackReo.new
    expect(bags).to be_an_instance_of(RucksackReo)
    expect(bags.duplicates).to eq([])
  end

  it 'can format the rucksack list into a usable format' do
    
  end
end