require "./rotator"

class Encrypt
  attr_reader :key, :date
  attr_accessor :write_doc, :read_doc

  def initialize(read_doc = nil, write_doc = nil, key = nil, date =nil)
    read_doc ? @read_doc = read_doc : @read_doc = File.read(ARGV[0]).strip
    write_doc ? @write_doc = write_doc : @write_doc = (ARGV[1])
    key ? @key = key : @key = ARGV[2]
    date ? @date = date : @date = ARGV[3]
    @rotator = Rotator.new(@read_doc, @key, @date)
  end

  def write_encrypted_file
    output = File.open(@write_doc, "w")
    encrypted_text = @rotator.encrypt_rotate_characters
    output.write(encrypted_text)
    output.close
  end

end

Encrypt.new.write_encrypted_file
