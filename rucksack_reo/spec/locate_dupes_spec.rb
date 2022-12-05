require 'pry'
require 'Rspec'
require_relative '../lib/locate_dupes'

describe RucksackReo do
  before(:each) do
    @bags = RucksackReo.new
    @test_file = './rucksack_reo/test_rucksack_list.txt'
    @file = './rucksack_reo/rucksack_list.txt'
  end
  it 'exists and has attributes' do
    expect(@bags).to be_an_instance_of(RucksackReo)
    expect(@bags.duplicates).to eq([])
  end

  it 'can format the rucksack list into a usable format' do
    @bags.format_file(@test_file)
    formatted_file_data = @bags.formatted_list
    expect(formatted_file_data).to be_an(Array)
    expect(formatted_file_data[1]).to be_an(Array)
  end
end