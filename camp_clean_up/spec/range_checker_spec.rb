require 'pry'
require 'Rspec'
require_relative '../lib/range_checker.rb'

describe RangeChecker do
  it 'exists' do
    checker = RangeChecker.new
    expect(checker).to be_an_instance_of(RangeChecker)
  end

  it 'can determine if one range fully contains another' do
    checker = RangeChecker.new
    a = ["1234", "23"]
    b = ["1234", "5678"]
    c = ["123456", "5678"]

    expect(checker.contained?(a)).to eq(true)
    expect(checker.contained?(b)).to eq(false)
    expect(checker.contained?(c)).to eq(false)
  end
end