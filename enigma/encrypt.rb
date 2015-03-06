require "./rotator"

class Encrypt
  attr_reader :read_doc, :key, :date
  attr_accessor :write_doc

  def initialize(read_doc = nil, write_doc = nil, key = nil, date =nil)
    read_doc ? @read_doc = read_doc : @read_doc = File.read(ARGV[0])
    write_doc ? @write_doc = write_doc : @write_doc = (ARGV[1])
    key ? @key = key : @key = ARGV[2]
    date ? @date = date : @date = ARGV[3]
    @rotator = Rotator.new(@read_doc, @key, @date)
  end

  def write_encrypted_file
    output = File.open(@write_doc, "w")
    output.write(@rotator.encrypt_rotate_characters.join)
    output.close
  end

end
