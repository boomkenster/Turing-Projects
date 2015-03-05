class KeyCalculator
  attr_reader :key

  def initialize(key = nil)
    @key = key || key_generator
  end

  def first_rotation
    #each_with_index
    key_string = key
    first_rotation_values = []
    4.times do |n|
      first_rotation_values << (key_string[n] + key_string[n+1]).to_i
    end
    first_rotation_values
  end

private
  def key_generator
    rand_key = []
    generate_key = (0..9).to_a
    5.times.map do
      rand_key << generate_key.shuffle.first.to_s
    end
    rand_key.join
  end
end

# keycal = KeyCalculator.new
# puts keycal.key
# puts keycal.first_rotation.inspect
# puts keycal.first_rotation.inspect
