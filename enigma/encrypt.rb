require "./key_calculator"
require "./offset_calculator"

class Encrypt
  attr_reader :kcalculator, :ocalculator

  def initialize
    @kcalculator = KeyCalculator.new
    t = Time.now
    t = t.strftime("%e%m%y").to_i
    @ocalculator = OffsetCalculator.new(t)
  end

  character_map = ('a'..'z').to_a + (0..9).to_a + [" ",".",","]
  def putters
    puts @kcalculator.first_rotation
    puts @ocalculator.second_rotation
  end




end
encrypt = Encrypt.new

# puts encrypt.kcalculator.first_rotation
# puts encrypt.ocalculator.second_rotation
encrypt.putters
