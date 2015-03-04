class OffsetCalculator
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def square_date
    input ** 2
  end

  def second_rotation
    date_squared = square_date.to_s.chars
    last_four = date_squared[-4..-1].map{|value| value.to_i}
  end

end
