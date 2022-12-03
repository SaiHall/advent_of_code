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

  it 'can reformat read array into a hash of sums, and store' do
    elf_list = CalorieCounter.new
    x = elf_list.translate_list('./elf_calories/test_calorie_list.txt')
    expect(x).to be_a(Hash)
    expect(x["elf-0"]).to eq(6000)
    expect(elf_list.breakdown).to be_a(Hash)
    expect(elf_list.breakdown.empty?).to be(false)
  end

  it 'can return the highest sum from breakdown list' do
    elf_list = CalorieCounter.new
    highest_sum = elf_list.highest_calorie_count('./elf_calories/test_calorie_list.txt')
    expect(highest_sum).to eq(24000)
  end

  it 'can give the sum of the top three calorie amounts' do
    elf_list = CalorieCounter.new
    top_three_total = elf_list.top_three_sum('./elf_calories/test_calorie_list.txt')
    expect(top_three_total).to eq(45000)
  end

  # elf-87 babyyyy
  it 'can return the answer to the first puzzle, highest single calorie amount' do
    elf_list = CalorieCounter.new
    highest_sum = elf_list.highest_calorie_count('./elf_calories/calorie_list.txt')
    expect(highest_sum).to eq(72718)
  end

  it 'can return the answer to the second puzzle, sum of top three amounts' do
    elf_list = CalorieCounter.new
    top_three_total = elf_list.top_three_sum('./elf_calories/calorie_list.txt')
    expect(top_three_total).to eq(213089)
  end
end