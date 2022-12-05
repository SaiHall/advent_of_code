require 'pry'

class RucksackReo

  attr_reader :duplicates, :formatted_list
  def initialize
    @duplicates = []
    @formatted_list = []
    @score_hash = {}
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

  def create_score_hash
    score_hash = {}
    n = 0
    ("a".."z").each do |letter|
      n += 1
      @score_hash["#{letter}"] = n
    end
    ("A".."Z").each do |letter|
      n += 1
      @score_hash["#{letter}"] = n
    end
  end

  def sum_dupes
    total = 0
    @duplicates.each do |letter|
     total += @score_hash["#{letter}"]
    end
    total
  end

  def format_elves(file_loc)
    array = read_file_in(file_loc)
    spread = array.map do |e|
      e.chars
    end
  end

  def find_elf_dupes(file_loc)
    start_num = 0
    end_num = 2
    @duplicates = []
    x = format_elves(file_loc)
    until end_num > x.length do
      y = x[start_num].intersection(x[start_num + 1], x[end_num])
      @duplicates << y
      start_num += 3
      end_num += 3
    end
    @duplicates.flatten!
  end
end