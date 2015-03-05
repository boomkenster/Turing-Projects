require 'minitest/autorun'
require 'minitest/pride'
require './encrypt'

class EncryptTest < Minitest::Test
  def test_it_exist
    assert true
  end

  def test_rotation_values_add
    calc = KeyCalculator.new("adsf")
    encrypt = Encrypt.new
    calc.stub :key, 12345 do #offset = 030415*2 = 925072225 [2,2,2,5]
    assert_equal [14,25,36,50], encrypt.encrypt_total_rotation
    end
  end

end
