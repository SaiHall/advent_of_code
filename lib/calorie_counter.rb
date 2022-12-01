require 'pry'

class CalorieCounter

  attr_reader :breakdown
  def initialize
    @breakdown = {}
  end

  def read_list(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n\n")
  end

  def translate_list(file_loc)
    x = read_list(file_loc)
    y = x.map { |e| e.split("\n")}
    y.each_index do |index|
      @breakdown["elf-#{index}"] = y[index].map { |num| num.to_i}.sum
    end
    return @breakdown
  end

  def highest_calorie_count(file_loc)
    translate_list(file_loc)
    @breakdown.values.max
  end
end