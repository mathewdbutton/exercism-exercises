class Squares
  POWER = 2
  def initialize(natural_number)
      @natural_number = natural_number
  end

  def square_of_sum
    (1..@natural_number).sum ** POWER
  end

  def sum_of_squares
    (1..@natural_number).map { |n| n ** POWER  }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end

end

module BookKeeping
  VERSION = 4
end
