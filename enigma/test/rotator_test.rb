require_relative 'test_helper'
require_relative '../rotator'

class RotatorTest < Minitest::Test
  def test_it_exist
    assert Rotator
  end

  def test_total_rotation_adds_values
    rot = Rotator.new("asdf", "12345", "030515") #offset 5225
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

  def test_key_and_offset_are_added
    rot = Rotator.new("abdc", "12345", "030515")
    assert_equal [17, 25, 36, 50], rot.sum_key_offset
  end

  def test_aggregatte_offset_matches_length_of_message
    rot = Rotator.new("abdasdfasdfasdfc", "12345", "030515")
    assert_equal [17, 25, 36, 50, 17, 25, 36, 50, 17, 25, 36, 50, 17, 25, 36, 50], rot.aggregate_offset
  end

  def test_final_rotation
    rot = Rotator.new("abdc", "12345", "030515")
    assert_equal [17,26,0,13], rot.encrypted_position
  end

  def test_characters_are_being_rotated
    encrypt = Rotator.new("abdc", "12345", "030515")
    assert_equal "r0an", encrypt.encrypt_rotate_characters
  end

  def test_that_ruby_encrypted_correctly
    encrypt = Rotator.new("ruby", "41521", "020315" )
    assert_equal "2.ql", encrypt.encrypt_rotate_characters

    encrypt = Rotator.new("ruby ruby", "41521", "020315" )
    assert_equal "2.qli8919", encrypt.encrypt_rotate_characters

    encrypt = Rotator.new("it is all sunshine and butterflies", "43211", "030315")
    assert_equal "vouy55x1y5c 0n4y0,uq0.ur7odu4a8yrn", encrypt.encrypt_rotate_characters

    encrypt = Rotator.new("7492739", "98763", "011199")
    assert_equal "vg7ovf7", encrypt.encrypt_rotate_characters

    encrypt = Rotator.new(" ,. ., .", "98763", "011199")
    assert_equal "yo9wzo8x", encrypt.encrypt_rotate_characters
  end

  def test_that_ruby_decrypts_correctly
    decrypt = Rotator.new("2.ql", "41521", "020315" )
    assert_equal "ruby", decrypt.decrypt_rotate_characters

    decrypt = Rotator.new("2.qli8919", "41521", "020315" )
    assert_equal "ruby ruby", decrypt.decrypt_rotate_characters

    decrypt = Rotator.new("vouy55x1y5c 0n4y0,uq0.ur7odu4a8yrn", "43211", "030315")
    assert_equal "it is all sunshine and butterflies", decrypt.decrypt_rotate_characters

    decrypt = Rotator.new("vg7ovf7", "98763", "011199")
    assert_equal "7492739", decrypt.decrypt_rotate_characters

    decrypt = Rotator.new("yo9wzo8x", "98763", "011199")
    assert_equal " ,. ., .", decrypt.decrypt_rotate_characters
  end
end
