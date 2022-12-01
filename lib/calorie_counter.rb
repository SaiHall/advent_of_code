require 'pry'

class CalorieCounter
  def initialize
  end

  def read_list(file_loc)
    file = File.open(file_loc)
    file_data = file.read
    file.close
    file_data.split("\n\n")
  end
end