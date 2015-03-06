require_relative 'test_helper'
require_relative '../key_calculator'

class KeyCalculatorTest < Minitest::Test

  def test_it_exist
    assert KeyCalculator
  end

  def test_key_is_5_numbers
    calc = KeyCalculator.new(12345)
    assert_equal 5, calc.key.to_s.length
  end

  def test_rotation_numbers

    calc = KeyCalculator.new("12345")
    assert_equal [12,23,34,45], calc.first_rotation

    calc = KeyCalculator.new("54321")
    assert_equal [54,43,32,21], calc.first_rotation

    calc = KeyCalculator.new("98765")
    assert_equal [98,87,76,65], calc.first_rotation

    calc = KeyCalculator.new("02345")
    assert_equal [2,23,34,45], calc.first_rotation
  end
end
