require 'minitest/autorun'
require 'minitest/pride'
require './key_calculator'

class KeyCalculatorTest < Minitest::Test

def test_it_exist
  assert true
end

def test_key_is_5_numbers
  calc = KeyCalculator.new
  assert_equal 5, calc.key.length
end

def test_rotation_numbers
  calc = KeyCalculator.new
  calc.stub :key, 12345 do
    assert_equal [12,23,34,45], calc.first_rotation
  end
end



end
