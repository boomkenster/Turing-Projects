require "./key_calculator"
require "./offset_calculator"

class Encrypt
  attr_reader :kcalculator, :ocalculator, :character_map

  def initialize(message)
    @message = message
    @character_map = ('a'..'z').to_a + (0..9).to_a + [" ",".",","] #39 characters
    @kcalculator = KeyCalculator.new
    t = Time.now
    t = t.strftime("%e%m%y").to_i
    @ocalculator = OffsetCalculator.new(t)
  end

  def encrypt_total_rotation
    total_rotation = @kcalculator.first_rotation.zip(@ocalculator.second_rotation)
    total_rotation.map{|number| number[0] + number[1]}
  end

  def message_encryption
    double_map = @character_map + @character_map
    divide_rotation = encrypt_total_rotation.map{|value|}
    @message
  end

end
encrypt = Encrypt.new("asdf")
puts encrypt.character_map.length
# puts encrypt.kcalculator.first_rotation
# puts encrypt.ocalculator.second_rotation
# puts encrypt.encrypt_total_rotation
