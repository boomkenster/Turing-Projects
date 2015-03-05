require "./key_calculator"
require "./offset_calculator"

class Encrypt
  attr_reader :kcalculator, :ocalculator, :character_map
  attr_accessor :message

  def initialize(message = File.open('encrypt.txt'))
    @message = message
    @character_map = ('a'..'z').to_a + (0..9).to_a + [" ",".",","] #39 characters
    @kcalculator = KeyCalculator.new
    t = Time.now
    t = t.strftime("%e%m%y").to_i
    @ocalculator = OffsetCalculator.new(t)
  end

  def parse_message
    message.map {|row| row}
  end
end
encrypt = Encrypt.new
puts encrypt.parse_message
# puts encrypt.character_map.length
# puts encrypt.kcalculator.first_rotation
# puts encrypt.ocalculator.second_rotation
# puts encrypt.encrypt_total_rotation
