require 'minitest/autorun'
require 'minitest/pride'
require_relative '../offset_calculator'

class OffsetCalculatorTest < Minitest::Test

def test_it_exist
  assert true
end

def test_it_can_take_a_value
  calc = OffsetCalculator.new("date")
  assert_equal "date", calc.input
end

def test_date_is_squared
  calc = OffsetCalculator.new(10)
  assert_equal 100, calc.square_date

  calc = OffsetCalculator.new(100000)
  assert_equal 10000000000, calc.square_date
end

def test_value_of_last_four
  calc = OffsetCalculator.new(123) #15129
  assert_equal [5,1,2,9], calc.second_rotation

  calc = OffsetCalculator.new(30815) #949564225
  assert_equal [4,2,2,5], calc.second_rotation
end


end
