require 'pry'

class RangeChecker

  def initialize
  end

  def contained?(array)
    array[0].include?(array[1]) || array[1].include?(array[0])
  end
end