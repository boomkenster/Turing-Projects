require "./key_calculator"
require "./offset_calculator"
require "pry"

class Rotator
  attr_reader :kcalculator, :character_map
  attr_accessor :message, :ocalculator

  def initialize(message, key=nil, date = nil)
    @message = message
    @character_map = ('a'..'z').to_a + (0..9).to_a.map(&:to_s) + [" ",".",","] #39 characters
    @kcalculator = KeyCalculator.new(key)

    unless date
      date = Time.now.strftime("%m%d%y").to_i
    end

    @ocalculator = OffsetCalculator.new(date)
  end

  def replace_item_with_index
    split_message = message.chars #.each_slice(4).to_a.map(&:join)
    split_message.map do |item|
      item = character_map.index(item)
    end
  end

  def sum_key_offset
    sum_rotation = @kcalculator.first_rotation.zip(@ocalculator.second_rotation)
    sum_rotation.map{|number| number[0] + number[1]}
  end

  def encrypted_position
    position = replace_item_with_index.zip(sum_key_offset)
    sum = position.map{|number| number[0] + number[1]}
    sum.map {|value| value % 39}
  end

  def rotate_characters
    encrypted_position.map {|position| character_map[position]}
  end

end

# puts ARGV.inspect
#"ruby" encrpyted with 41521 and 020315 -> "2.ql"
#key 41, 15, 52, 21
#offset 9, 2, 2, 5
#41, 15, 52, 21 + 9,2,2,5 -> 50, 17, 54, 26

# rot = Rotator.new("ruby", "41521")
# puts rot.character_map.inspect
# puts rot.replace_item_with_index.inspect
# puts rot.encrypted_position.inspect
# puts rot.rotate_characters.inspect
# puts rot.append_message_and_values.inspect
