require_relative 'test_helper'
require_relative '../rotator'

class RotatorTest < Minitest::Test
  def test_it_exist
    assert true
  end

  def test_total_rotation_adds_values
    encrypt = Rotator.new("asdf", 12345)
    assert_equal [17,25,36,50], encrypt.total_rotation
  end

  def test_characters_are_appended_to_thier_rotate_number
    encrypt = Rotator.new("asdf", 12345)
    assert_equal [[["a",17],["s",25],["d",36],["f", 11]]], encrypt.appending_values
  end

  def test_characters_are_being_rotated
    skip
    encrypt = Rotator.new("asdf", 12345)
    assert_equal [], encrypt.rotate_characters
  end

end
