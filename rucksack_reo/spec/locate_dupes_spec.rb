require 'pry'
require 'Rspec'
require_relative '../lib/locate_dupes'

describe RucksackReo do
  before(:each) do
    @bags = RucksackReo.new
    @test_file = './rucksack_reo/test_rucksack_list.txt'
    @file = './rucksack_reo/rucksack_list.txt'
    @elf_test = './rucksack_reo/test_elf_id.txt'
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

  it 'sums duplicate from challenge file' do
    @bags.format_file(@file)
    @bags.find_dupes
    @bags.create_score_hash
    expect(@bags.sum_dupes).to eq(8394)
  end

  it 'can find dupes in groups of three rucksacks, and sum them' do
    @bags.find_elf_dupes(@elf_test)
    @bags.create_score_hash
    dupes = @bags.duplicates
    expect(dupes).to eq(["r", "Z"])
    expect(@bags.sum_dupes).to eq(70)
  end

  it 'can find dupes in groups of three rucksacks, and sum them for challenge list' do
    @bags.find_elf_dupes(@file)
    @bags.create_score_hash
    dupes = @bags.duplicates
    expect(@bags.sum_dupes).to eq(2413)
  end
end