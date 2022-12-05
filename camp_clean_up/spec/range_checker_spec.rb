require 'pry'
require 'Rspec'
require_relative '../lib/range_checker'

describe RangeChecker do
  before(:each) do
    @checker = RangeChecker.new
    @file = './camp_clean_up/ranges.txt'
    @test = './camp_clean_up/test_ranges.txt'
  end
  it 'exists' do
    expect(@checker).to be_an_instance_of(RangeChecker)
  end

  it 'can determine if one range fully contains another' do
    a = [[1, 2, 3, 4], [1, 2]]
    b = [[1, 2, 3, 4], [5, 6, 7, 8]]
    c = [[1, 2, 3, 4, 5, 6], [5, 6, 7, 8]]

    expect(@checker.contained?(a)).to eq(true)
    expect(@checker.contained?(b)).to eq(false)
    expect(@checker.contained?(c)).to eq(false)
  end

  it 'can read and format txt file' do
    @checker.format_pair_list(@test)
    expect(@checker.pair_list).to be_an(Array)
    expect(@checker.pair_list[0]).to be_an(Array)
    expect(@checker.pair_list[0][1]).to be_an(Array)
  end

  it 'can sum amount of total overlaps in a given file' do
    @checker.format_pair_list(@test)
    expect(@checker.sum_tot_overlap).to eq(2)
  end

  it 'can give the sum for the challenge file' do
    @checker.format_pair_list(@file)
    expect(@checker.sum_tot_overlap).to eq(651) 
  end

  it 'can tell if there is any overlap at all' do
    a = [[1, 2, 3, 4], [1, 2]]
    b = [[1, 2, 3, 4], [5, 6, 7, 8]]
    c = [[1, 2, 3, 4, 5, 6], [5, 6, 7, 8]]
    expect(@checker.overlapping?(a)).to eq(true)
    expect(@checker.overlapping?(b)).to eq(false)
    expect(@checker.overlapping?(c)).to eq(true)
  end
end