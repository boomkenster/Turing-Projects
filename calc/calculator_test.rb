require 'minitest/autorun'
require './calculator'

class CalculatorTest < Minitest::Test
  def test_it_adds
    calc = Calculator.new
    result = calc.add(5, 6)
    assert_equal 11, result
  end

  def test_it_adds_with_a_negative
    calc = Calculator.new
    result = calc.add(5, -6)
    assert_equal -1, result
  end

  def test_it_subtracts
    calc = Calculator.new
    result = calc.subtract(10, 6)
    assert_equal 4, result
  end

  def test_it_squares
    calc = Calculator.new
    result = calc.square(10)
    assert_equal 100, result
  end

  def test_it_divides
    calc = Calculator.new
    result = calc.divide(9, 3)
    assert_equal 3, result
  end

  def test_it_multiplies
    calc = Calculator.new
    result = calc.multiply(3,3)
    assert_equal 9, result
  end

  def test_it_raises_to_a_power
    calc = Calculator.new
    result = calc.x_to_y(2,3)
    assert_equal 8, result
  end

  def test_it_records_the_last_result
    calc = Calculator.new
    calc.add(5,5)
    result = calc.last_result
    assert_equal 10, result
    # Call calc.last_result
    # Verify the last_result is correct
  end

  def test_it_clears
    calc = Calculator.new
    calc.add(7,7)
    calc.last_result
    result = calc.clear
    assert_equal 0, result
  end
end
