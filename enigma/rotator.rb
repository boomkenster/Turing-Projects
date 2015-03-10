require "./key_calculator"
require "./offset_calculator"

class Rotator
  attr_reader :key_calculator, :character_map
  attr_accessor :message, :offset_calculator

  def initialize(message, key=nil, date = nil)
    @message = message
    @character_map = ('a'..'z').to_a + (0..9).to_a.map(&:to_s) + [" ",".",","] #39 characters
    @key_calculator = KeyCalculator.new(key)

    unless date
      date = Time.now.strftime("%m%d%y").to_i
    end

    @offset_calculator = OffsetCalculator.new(date)
  end

  def replace_item_with_index
    split_message = message.chars
    split_message.map do |item|
      character_map.index(item)
    end
  end

  def sum_key_offset
    sum_rotation = @key_calculator.first_rotation.zip(@offset_calculator.second_rotation)
    sum_rotation.map{|number| number[0] + number[1]}
  end

  def aggregate_offset
    message_length = message.length/4
    repeated_sum = sum_key_offset + sum_key_offset
    message_length.times do
      repeated_sum += repeated_sum
    end
    repeated_sum.take(message.length)
  end

  def decrypted_position
    position = replace_item_with_index.zip(aggregate_offset)
    sum = position.map{|number| number[1] - number[0]}
    sum.map do |value|
      if value <= 0
        value.abs
      elsif value >= 78
        78 - value
      else
        39 - value.abs
      end
    end
  end

  def encrypted_position
    position = replace_item_with_index.zip(aggregate_offset)
    sum = position.map{|number| number[0] + number[1]}
    sum.map {|value| value % 39}
  end

  def encrypt_rotate_characters
    encrypted_position.map {|position| character_map[position]}.join
  end

  def decrypt_rotate_characters
    decrypted_position.map {|position| character_map[position]}.join
  end

end

# rot = Rotator.new("33rzhu26h,.821z8orr8nrsc3v,p5zz2rph7xf", "11111", "020315")
# puts rot.character_map.inspect
# puts rot.replace_item_with_index.inspect
# puts rot.aggregate_offset.inspect
# puts rot.encrypt_rotate_characters.inspect
# puts rot.decrypted_position.inspect
# puts rot.decrypt_rotate_characters.inspect
