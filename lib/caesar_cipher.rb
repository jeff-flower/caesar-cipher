# Encrypt and Decrypt English language strings with a specified shift
class CaesarCipher
  def initialize(right_shift)
    raise ArgumentError, 'right shift outside range of 1 - 25' if right_shift < 1 || right_shift > 25

    @right_shift = right_shift

    # TODO: initialize these only once
    @lowercase_lookup = {}
    ('a'..'z').to_a.each_with_index do |char, index|
      @lowercase_lookup[char] = index
    end

    @uppercase_lookup = {}
    ('A'..'Z').to_a.each_with_index do |char, index|
      @uppercase_lookup[char] = index
    end
  end

  attr_reader :right_shift

  def encrypt(plaintext)
    raise ArgumentError, 'Argument to encrypt should be a string' unless plaintext.is_a?(String)

    plaintext.chars.reduce('') { |ciphertext, char| ciphertext << encrypt_char(char) }
  end

  def decrypt(ciphertext)
    raise ArgumentError, 'Argument to encrypt should be a string' unless ciphertext.is_a?(String)

    ciphertext.chars.reduce('') { |plaintext, char| plaintext << decrypt_char(char) }
  end

  private

  def encrypt_char(char)
    return char if alphabetic?(char)

    if uppercase?(char)
      char_as_digit = @uppercase_lookup[char]
      uppercase_as_encrypted_digit = encrypt_digit(char_as_digit)
      @uppercase_lookup.key(uppercase_as_encrypted_digit)
    else
      char_as_digit = @lowercase_lookup[char]
      lowercase_as_encrypted_digit = encrypt_digit(char_as_digit)
      @lowercase_lookup.key(lowercase_as_encrypted_digit)
    end
  end

  def decrypt_char(char)
    return char if alphabetic?(char)

    if uppercase?(char)
      char_as_digit = @uppercase_lookup[char]
      uppercase_as_decrypted_digit = decrypt_digit(char_as_digit)
      @uppercase_lookup.key(uppercase_as_decrypted_digit)
    else
      char_as_digit = @lowercase_lookup[char]
      lowercase_as_decrypted_digit = decrypt_digit(char_as_digit)
      @lowercase_lookup.key(lowercase_as_decrypted_digit)
    end
  end

  def uppercase?(char)
    char.upcase == char
  end

  def alphabetic?(char)
    char.match?(/[^a-zA-Z]/)
  end

  # To encrypt a digit representing a letter in the English alphabet
  # for shift of n: encrypted digit = (digit + shift) % 26
  def encrypt_digit(digit)
    (digit + @right_shift) % 26
  end

  # To decrypt a digit representing a letter in the English alphabet
  # for shift of n: encrypted digit = (digit - shift) % 26
  def decrypt_digit(digit)
    (digit - @right_shift) % 26
  end
end
