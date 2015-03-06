require "./key_calculator"
require "./offset_calculator"
require "pry"

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
    split_message = message.chars #.each_slice(4).to_a.map(&:join)
    split_message.map do |item|
      item = character_map.index(item)
    end
  end

  def sum_key_offset
    sum_rotation = @key_calculator.first_rotation.zip(@offset_calculator.second_rotation)
    sum_rotation.map{|number| number[0] + number[1]}
  end

  def decrypted_position
    position = replace_item_with_index.zip(sum_key_offset)
    sum = position.map{|number| number[-0] + number[-1]}
    sum.map {|value| value % 39}
  end

  def encrypted_position
    position = replace_item_with_index.zip(sum_key_offset)
    sum = position.map{|number| number[0] + number[1]}
    sum.map {|value| value % 39}
  end

  def encrypt_rotate_characters
    encrypted_position.map {|position| character_map[position]}
  end

  def dencrypt_rotate_characters
    dencrypted_position.map {|position| character_map[position]}
  end

end

# puts ARGV.inspect

# rot = Rotator.new("ruby", "41521")
# puts rot.character_map.inspect
# puts rot.replace_item_with_index.inspect
# puts rot.encrypted_position.inspect
# puts rot.rotate_characters.inspect
# puts rot.append_message_and_values.inspect
