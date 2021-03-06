require_relative 'test_helper'
require_relative '../crack'

class CrackTest < Minitest::Test

 def test_it_exist
   assert Crack
 end

 def test_it_returns_key
   brute_force = Crack.new("4qesb7hv77z49pos9bek9aeldq0oacss0peiubunu8","newdoc", "020315")
   assert_equal 13444, brute_force.cracker
 end

 def test_file_is_written
   brute_force = Crack.new("4qesb7hv77z49pos9bek9aeldq0oacss0peiubunu8","crackedcode", "020315")
   assert_equal "it is all sunshine and butterflies ..end..", File.read("crackedcode")
 end
end
