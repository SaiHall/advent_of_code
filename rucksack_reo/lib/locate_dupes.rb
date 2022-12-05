require 'pry'

class RucksackReo

  attr_reader :duplicates, :formatted_list
  def initialize
    @duplicates = []
    @formatted_list = []
  end

  def read_file_in(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n")
  end

  def format_file(file_loc)
    content_ary = read_file_in(file_loc)
    content_ary.each do |e|
      start_num = e.length / 2
      end_num = start_num - 1
      x = e[0..end_num].chars.uniq
      y = e[start_num..-1].chars.uniq
      @formatted_list.push([x, y])
    end
  end

  def find_dupes
    @formatted_list.each do |a|
      @duplicates.push(a[0].intersection(a[1]))
    end
    @duplicates = @duplicates.flatten
  end
end