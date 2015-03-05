require "./key_calculator"
require "./offset_calculator"

class Rotator
  attr_reader :kcalculator, :ocalculator, :character_map
  attr_accessor :message

  def initialize(message, key=nil)
    @message = message
    @character_map = ('a'..'z').to_a + (0..9).to_a + [" ",".",","] #39 characters
    @kcalculator = KeyCalculator.new(key)
    t = Time.now
    t = t.strftime("%m%d%y").to_i
    @ocalculator = OffsetCalculator.new(t)
    @double_map = @character_map + @character_map
  end

  def appending_values
    divide_rotation = total_rotation.map{|value| value % 39}
    # split_message = message.chars.each_slice(4).to_a#.map(&:join)
    # indices_of_message = split_message.map do |code|
    #    code.map do |character|
    #      character = character_map.index[character]
    #    end
    # end
  end
    # split_message.map do |fours|
    #   fours.chars.zip(divide_rotation)
    # end

  def total_rotation
    total_rotation = @kcalculator.first_rotation.zip(@ocalculator.second_rotation)
    total_rotation.map{|number| number[0] + number[1]}
  end


  def rotate_characters
  end

end

rot = Rotator.new("this is my message")
# puts rot.total_rotation
puts rot.appending_values.inspect
# puts rot.append_message_and_values.inspect
