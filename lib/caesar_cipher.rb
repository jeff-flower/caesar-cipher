# require 'pry-byebug'

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

    plaintext.split("").reduce("") { |ciphertext, char| ciphertext << encrypt_char(char) }
  end

  def decrypt(ciphertext)
    unless ciphertext.is_a?(String)
      # TODO: throw error instead?
      return "Input Error - invalid argument type"
    end

    if ciphertext.length == 0
      # TODO: throw error instead?
      return "Input Error - empty string"
    end

    ciphertext.split("").reduce("") { |plaintext, char| plaintext << decrypt_char(char) }
  end

  private
    def encrypt_char (char)
      if is_not_alphabetic?(char)
        return char
      end

      # TODO: what if the char doesn't exist in the lookup?
      if is_uppercase?(char)
        char_as_digit = @uppercase_lookup[char]
        uppercase_as_encrypted_digit = encrypt_digit(char_as_digit) 
        return @uppercase_lookup.key(uppercase_as_encrypted_digit)
      else
        char_as_digit = @lowercase_lookup[char]
        lowercase_as_encrypted_digit = encrypt_digit(char_as_digit)
        return @lowercase_lookup.key(lowercase_as_encrypted_digit)
      end
    end

    def decrypt_char (char)
      if is_not_alphabetic?(char)
        return char
      end

      # TODO: what if the char doesn't exist in the lookup?
      if is_uppercase?(char)
        char_as_digit = @uppercase_lookup[char]
        uppercase_as_decrypted_digit = decrypt_digit(char_as_digit) 
        return @uppercase_lookup.key(uppercase_as_decrypted_digit)
      else
        char_as_digit = @lowercase_lookup[char]
        lowercase_as_decrypted_digit = decrypt_digit(char_as_digit)
        return @lowercase_lookup.key(lowercase_as_decrypted_digit)
      end
    end

    def is_uppercase? (char) 
      char.upcase == char
    end

    def is_not_alphabetic? (char)
      char.match?(/[^a-zA-Z]/)
    end

    # To encrypt a digit representing a letter in the English alphabet
    # for shift of n: encrypted digit = (digit + shift) % 26
    def encrypt_digit (digit)
      (digit + @right_shift) % 26
    end

    # To decrypt a digit representing a letter in the English alphabet
    # for shift of n: encrypted digit = (digit - shift) % 26
    def decrypt_digit (digit)
      (digit - @right_shift) % 26
    end
end

