require 'pry'

class SupplyStack

  attr_reader :stacks, :directions
  def initialize(array)
    @stacks = array
    @directions = []
  end
  def read_file(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n")
  end

  def get_directions(file_loc)
    direct = read_file(file_loc)
    direct.each do |instruction|
      x = instruction.split
      @directions << {amount: (x[1].to_i), start: ((x[3].to_i) - 1), end: ((x[5].to_i) - 1)}
    end
  end

  def execute_directions
    @directions.each do |direct|
      (direct[:amount]).times do
       @stacks[direct[:end]].push(@stacks[(direct[:start])].pop)
      end
    end
  end

  def end_phrase
    @stacks.collect { |stack| stack[-1] }.join
  end

  def execute_cm9001_directions
    @directions.each do |direct|
      @stacks[direct[:end]].push(@stacks[direct[:start]].pop(direct[:amount])).flatten!
    end
  end
end