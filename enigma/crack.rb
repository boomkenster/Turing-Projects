require_relative './rotator'
require_relative './key_calculator'
require_relative './offset_calculator'


class Crack
attr_reader :message

  def initialize(message, date = nil)
    @message = message
    @date = date
  end

  def cracker
    @key = 0
    @rotator = Rotator.new(message, @key_attempt, @date)
    until @rotator.decrypt_rotate_characters[-7..-1] == "..end.."
      @key_attempt = @key.to_s.rjust(5, "0")
      @rotator = Rotator.new(message, @key_attempt, @date)
      puts @key +=1
    end
    puts @key - 1
  end

end

# cracking = Crack.new("4v7gt4vxn8p2vonyp4syj", "020315")
# cracking.cracker
