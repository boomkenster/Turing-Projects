require "./rotator"

class Decrypt
  attr_reader :key, :date, :write_doc, :read_doc

  def initialize(read_doc = nil, write_doc = nil, key = nil, date =nil)
    read_doc ? @read_doc = read_doc : @read_doc = ARGV[0]
    write_doc ? @write_doc = write_doc : @write_doc = ARGV[1]
    key ? @key = key : @key = ARGV[2]
    date ? @date = date : @date = ARGV[3]
    @rotator = Rotator.new(File.read(@read_doc), @key, @date)
  end

  def write_decrypted_file
    output = File.open(@write_doc, "w")
    decrypted_text = @rotator.decrypt_rotate_characters
    output.write(decrypted_text)
    output.close
  end

end

if __FILE__ == $0
Decrypt.new.write_decrypted_file
puts "Created #{Decrypt.new.read_doc} with the key #{Decrypt.new.key} and date #{Decrypt.new.date}"
end
