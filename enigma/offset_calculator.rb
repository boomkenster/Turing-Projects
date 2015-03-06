class OffsetCalculator
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def square_date
    input.to_i ** 2
  end

  def second_rotation
    squared_date = square_date.to_s.chars
    last_four = squared_date[-4..-1].map{|value| value.to_i}
  end

end

# off = OffsetCalculator.new("020315") #412699225
# puts off.square_date
# puts off.second_rotation
