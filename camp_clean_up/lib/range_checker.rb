require 'pry'

class RangeChecker

  attr_reader :pair_list
  def initialize
    @pair_list = []
  end

  def contained?(array)
    x = array[0].intersection(array[1])
    x == array[0] || x == array[1]
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
        ff = f.split('-')
        ((ff[0].to_i)..(ff[1].to_i)).to_a
      end
    end
  end

  def sum_tot_overlap
    count = 0
    @pair_list.each do |pair|
      count += 1 if contained?(pair)
    end
    count
  end

  def overlapping?(array)
    x = array[0].intersection(array[1])
    !x.empty?
  end
end