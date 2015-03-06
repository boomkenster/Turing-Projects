require_relative 'test_helper'
require_relative '../rotator'

class RotatorTest < Minitest::Test
  def test_it_exist
    assert true
  end

  def test_total_rotation_adds_values
    rot = Rotator.new("asdf", "12345") #offset 5225
    assert_equal [17,25,36,50], rot.sum_key_offset
  end

  def test_replace_letters_with_index
    rot = Rotator.new("abcd")
    assert_equal [0,1,2,3], rot.replace_item_with_index
  end

  def test_replace_numbers_with_index
    rot = Rotator.new("3213")
    assert_equal [29,28,27,29], rot.replace_item_with_index
  end

  def test_final_rotation
    rot = Rotator.new("abdc", "12345")
    assert_equal [17,26,0,13], rot.encrypted_position
  end

  def test_characters_are_being_rotated
    encrypt = Rotator.new("abdc", "12345")
    assert_equal ["r","0","a","n"], encrypt.rotate_characters
  end


end
