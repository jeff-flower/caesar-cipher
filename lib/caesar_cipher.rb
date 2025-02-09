class Caesar_Cipher
  def initialize(right_shift)
    if right_shift < 1 || right_shift > 25
      @right_shift = "Initialization Error - right shift outside range"
      return
    end

      @right_shift = right_shift

      # TODO: initialize these only once
      @lowercase_lookup = Hash.new
      ('a'..'z').to_a.each_with_index do |char, index|
        @lowercase_lookup[char] = index
      end

      @uppercase_lookup = Hash.new
      ('A'..'Z').to_a.each_with_index do |char, index|
        @uppercase_lookup[char] = index
      end
  end

  attr_reader :right_shift
  
  def encrypt(plaintext)
    unless plaintext.is_a?(String)
      # TODO: throw error instead?
      return "Input Error - invalid argument type"
    end

    if plaintext.length == 0
      # TODO: throw error instead?
      return "Input Error - empty string"
    end

    if is_uppercase?(plaintext)
      plaintext_as_digit = @uppercase_lookup[plaintext]
      encrypted_as_digit = (plaintext_as_digit + @right_shift) % 26
      @uppercase_lookup.key(encrypted_as_digit)
    else
      plaintext_as_digit = @lowercase_lookup[plaintext]
      encrypted_as_digit = (plaintext_as_digit + @right_shift) % 26
      @lowercase_lookup.key(encrypted_as_digit)
    end

    # a == 97, z = 122
    # Note: methods that might be helpful
    # each_char
    # each_codepoint (returns integer value for char)
    # ord (returns integer value for first index of given string)
    # Integer#chr returns string value of integer
  end

  private
    def is_uppercase? (char) 
      char.upcase == char
    end
end

