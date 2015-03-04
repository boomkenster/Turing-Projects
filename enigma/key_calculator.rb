class KeyCalculator
  attr_reader :key

  def initialize
    @key = key_generator
  end

  def first_rotation
    n = 0
    first_rotation_values = []
    4.times do
     first_rotation_values << (key.to_s[n] + key.to_s[n+1]).to_i
     n += 1
    end
  first_rotation_values
  end


private
  def key_generator
    generate_key = []
    5.times do
      generate_key << rand(0..9)
    end
    generate_key
  end
end
