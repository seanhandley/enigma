#ROTOR_3 = { offset: 5, mappings: [['a','b'],['b','d'],['c','f']]}
ROTOR_3 = { left: ['a', 'b', 'c', 'd', 'e', 'f'], right:['b','d','f','c','a', 'e']}

class Enigma
  def self.decipher(cipher_text)
    cipher_text
  end
end

class Rotor
  def initialize(params)
    @rotor_config = params[:rotor_config]
    @window_index = params[:window_index]
  end
  
  def encode_right_to_left(row_index)
    right_char = @rotor_config[:right][row_index + @window_index]
    encode(right_char, @rotor_config[:left])
  end
  
  def encode_left_to_right(row_index)
    left_char = @rotor_config[:left][row_index + @window_index]
    encode(left_char, @rotor_config[:right])
  end
  
  def encode(character, array)
    array.each_with_index do |char, i|
      if char == character
        next_index = i - @window_index
        return array.count + next_index if next_index < 0
        return next_index
      end
    end
  end
end