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
end