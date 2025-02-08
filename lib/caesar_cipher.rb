class Caesar_Cipher
  def initialize(right_shift)
    if right_shift < 1 || right_shift > 25
      @right_shift = "Initialization Error - right shift outside range"
      return
    end

      @right_shift = right_shift
  end

  attr_reader :right_shift
  
  def encrypt(plaintext)
    unless plaintext.is_a?(String)
      return "Input Error - invalid argument type"
    end

    if plaintext.length == 0
      return "Input Error - empty string"
    end
  end
end

