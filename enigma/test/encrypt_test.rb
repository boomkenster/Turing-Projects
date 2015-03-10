require_relative 'test_helper'
require_relative '../encrypt'

class EncryptTest < Minitest::Test
  def test_it_exist
    assert Encrypt
  end

  def test_input_file_is_read
    crypt = Encrypt.new("ruby")
    assert true, crypt.read_doc
  end

  def test_new_file_is_created
    crypt = Encrypt.new("ruby", "message", "41521", "020315")
    crypt.write_encrypted_file
    assert true, File.read("message")
  end

  def test_encrypted_data_is_in_new_file
    crypt = Encrypt.new("ruby", "message", "41521", "020315")
    crypt.write_encrypted_file
    assert_equal "2.ql", File.read("message")
  end

end
