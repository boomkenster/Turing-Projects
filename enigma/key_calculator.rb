class KeyCalculator
  attr_reader :key

  def initialize(key = nil)
    @key = key || key_generator
  end

  def first_rotation
    [
      (key[0] + key[1]).to_i,
      (key[1] + key[2]).to_i,
      (key[2] + key[3]).to_i,
      (key[3] + key[4]).to_i
    ]
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
