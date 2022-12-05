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
      @formatted_list.push([e[0..end_num], e[start_num..-1]])
    end
  end
end