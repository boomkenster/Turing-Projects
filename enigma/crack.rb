require_relative './rotator'

class Crack
attr_reader :message, :key, :write_doc, :date

  def initialize(message = nil, write_doc = nil, date)
    message ? @message = message : @message = File.read(ARGV[0])
    write_doc ? @write_doc = write_doc : @write_doc = ARGV[1]
    date ? @date = date : @date = ARGV[2]
  end

  def cracker
    @key = 0
    @rotator = Rotator.new(@message, @key_attempt, @date)
    until @rotator.decrypt_rotate_characters[-7..-1] == "..end.."
      @key_attempt = @key.to_s.rjust(5, "0")
      @rotator = Rotator.new(message, @key_attempt, @date)
      puts @key +=1
    end
  end

  def write_cracked_file
    cracker
    output = File.open(@write_doc, "w")
    decrypted_text = @rotator.decrypt_rotate_characters
    output.write(decrypted_text)
    output.close
  end

end

# Crack.new.write_cracked_file

brute_force = Crack.new("4qesb7hv77z49pos9bek9aeldq0oacss0peiubunu8","crackedcode", "020315")
brute_force.cracker
brute_force.write_cracked_file
