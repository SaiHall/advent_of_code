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

  it 'can locate the duplicates between rucksack pairs' do
    @bags.format_file(@test_file)
    @bags.find_dupes
    dupes = @bags.duplicates
    expect(dupes).to be_an(Array)
    expect(dupes).to eq(['p', 'L', 'P', 'v', 't', 's'])
  end

  it 'can score the pulled duplicates' do
    @bags.format_file(@test_file)
    @bags.find_dupes
    @bags.create_score_hash
    expect(@bags.sum_dupes).to eq(157)
  end
end