require_relative 'test_helper'
require_relative '../decrypt'

class DecryptTest < Minitest::Test
  def test_it_exist
    assert Decrypt
  end

  def test_read_doc_is_taken
    crypt = Decrypt.new("message", "decrypt_file", "41521", "020315")
    assert true, File.read("message")
  end

  def test_new_file_is_created
    crypt = Decrypt.new("message", "decrypt_file", "41521", "020315")
    crypt.write_decrypted_file
    assert true, File.read("message")
  end

  def test_encrypted_data_is_in_new_file
    crypt = Decrypt.new("message","decrypt_file", "41521", "020315")
    crypt.write_decrypted_file
    assert_equal "b0d5222", File.read("decrypt_file")
  end

end
