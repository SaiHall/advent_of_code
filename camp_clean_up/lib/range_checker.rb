require 'pry'

class RangeChecker

  attr_reader :pair_list
  def initialize
    @pair_list = []
  end

  def contained?(array)
    array[0].include?(array[1]) || array[1].include?(array[0])
  end

  def populate_pairs(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    @pair_list = file_data.split("\n")
  end

  def format_pair_list(file_loc)
    populate_pairs(file_loc)
    @pair_list = @pair_list.map do |e|
      e.split(',').map do |f|
        ((f[0].to_i)..(f[2].to_i)).to_a.join
      end
    end
  end
end