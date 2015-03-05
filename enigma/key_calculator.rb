class KeyCalculator
  attr_reader :key

  def initialize(key = nil)
    @key = key || key_generator
  end

  def first_rotation
    n = 0
    key_string = key.to_s
    first_rotation_values = []
    4.times do
     first_rotation_values << (key_string[n] + key_string[n+1]).to_i
     n += 1
   end
  first_rotation_values
  end


private
  def key_generator
    rand_key = []
    generate_key = (0..9).to_a #.to_s
    5.times.map do
    rand_key << generate_key.shuffle.first
    end
    rand_key.join.to_i
  end
end

# keycal = KeyCalculator.new
# puts keycal.key.inspect
# puts keycal.first_rotation.inspect
