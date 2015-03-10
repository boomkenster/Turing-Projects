require "./rotator"

class Encrypt
  attr_reader :key, :date, :write_doc, :read_doc

  def initialize(read_doc = nil, write_doc = nil, key = nil, date =nil)
    read_doc ? @read_doc = read_doc : File.read(@read_doc = ARGV[0])
    write_doc ? @write_doc = write_doc : @write_doc = ARGV[1]
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

if __FILE__ == $0
Encrypt.new.write_encrypted_file
puts "Created #{Encrypt.new.write_doc} with the key #{Encrypt.new.key} and date #{Encrypt.new.date}"
end
