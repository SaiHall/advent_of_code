require 'pry'
require 'Rspec'
require_relative '../lib/calorie_counter'

describe CalorieCounter do
  it 'exists' do
    elf_list = CalorieCounter.new
    expect(elf_list).to be_an_instance_of(CalorieCounter)
  end
  it 'can read from a txt file into an array' do
    elf_list = CalorieCounter.new
    x = elf_list.read_list('./elf_calories/test_calorie_list.txt')
    expect(x).to be_an(Array)
    expect(x.length).to eq(5)
  end
end