require_relative "./enigma"
require 'test/unit'

class TestEnigma < Test::Unit::TestCase
  
  def setup
    @input_text = "QMJIDO MZWZJFJR"
    @hw = "hello"
  end

  def test_hello_world_same_twice_coded
    assert_equal @hw, Enigma.decipher(Enigma.decipher(@hw))
  end
  
  # def test_hello_world_encoded_is_not_the_same
  #   assert_not_equal @hw, Enigma.decipher(@hw)
  # end
  
  def test_rotor_can_map_right_to_left
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 0)
    assert_equal 1, r1.encode_right_to_left(0)
  end
  
  def test_rotor_can_map_left_to_right
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 0)
    assert_equal 0, r1.encode_left_to_right(1)
  end
  
  def test_rotor_can_map_right_to_left_with_index_1
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 1)
    assert_equal 2, r1.encode_right_to_left(0)
  end
  
  def test_rotor_can_map_left_to_right_with_index_1
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 1)
    assert_equal 0, r1.encode_left_to_right(2)
  end
  
  def test_roll_around_lookup_works
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 1)
    assert_equal 5, r1.encode_left_to_right(0)
  end
  
  def test_roll_around_lookup_works_two
    r1 = Rotor.new(rotor_config: ROTOR_3, window_index: 2)
    assert_equal 5, r1.encode_left_to_right(1)
  end
  
end