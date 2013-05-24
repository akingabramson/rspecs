class Array

  def my_uniq
    result_arr = []
    self.each do |el|
      if !result_arr.include?(el)
        result_arr << el
      end
    end

    result_arr
  end

  def two_sum
    result_arr = []

    self.each_with_index do |val1, index1|
      rest = self[(index1)..-1]
      rest.each_with_index do |val2, index2|
        if (val1 + val2) == 0
          result_arr << [index1, index1 + index2]
        end
      end
    end
    result_arr
  end

  def my_transpose
    cols_arr = Array.new(self.length) {[]}

    self.each_with_index do |row, row_num|
      row.each_with_index do |item, col_num|
        cols_arr[col_num][row_num] = item

      end
    end
    cols_arr

  end


end

class Tower
  attr_accessor :towers

  def initialize(num)
    @towers = [[], [], []]
    fill_towers(num)
  end

  def fill_towers(num)
    orig_num = num

    until @towers[0].count == orig_num
      @towers[0] << num
      num -= 1
    end
  end

  def render
    p @towers
  end

  def move(origin, destination)
    if !@towers[origin].empty? && @towers[destination].last.to_i > @towers[origin].last.to_i
      from = @towers[origin].pop
      @towers[destination] << from
    elsif @towers[destination].last == nil
      from = @towers[origin].pop
      @towers[destination] << from
    else
      raise ArgumentError
    end
  end

  def won?
    if @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
      return true
    end
    return false
  end

end


def my_transpose(rows)
  cols_arr = Array.new([]) {rows.length}

  rows.each_with_index do |row, row_num|
    row.each_with_index do |item, col_num|
      cols_arr[col_num][row_num] = item

    end
  end
  cols_arr

end

def stock_picker(array)
  max_profit = 0
  final_days = []

  array.each_with_index do |buy_price, buy_day|
    array.each_with_index do |sell_price, sell_day|
      if sell_day > buy_day && (sell_price - buy_price) > max_profit
        max_profit = (sell_price - buy_price)
        final_days = [buy_day, sell_day]
      end
    end
  end
  final_days

end








