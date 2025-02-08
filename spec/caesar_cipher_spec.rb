require './lib/caesar_cipher.rb'

describe Caesar_Cipher do
  describe "#initialize" do
    it "sets the instance value of right shift" do
      cipher = Caesar_Cipher.new(3)
      expect(cipher.right_shift).to eql(3)
    end

    it "does not accept a value less than 1" do
      cipher = Caesar_Cipher.new(0)
      expect(cipher.right_shift).to eql("Initialization Error - right shift outside range")
    end

    it "does not accept a value greater than 25" do
      cipher = Caesar_Cipher.new(26)
      expect(cipher.right_shift).to eql("Initialization Error - right shift outside range")
    end

  end

  describe "#encrypt" do
    it "returns an error when a string is not passed in" do
      cipher = Caesar_Cipher.new(3)
      result = cipher.encrypt(42)
      expect(result).to eql("Input Error - invalid argument type")
    end

    it "returns an error when the string is empty" do
      cipher = Caesar_Cipher.new(3)
      result = cipher.encrypt("")
      expect(result).to eql("Input Error - empty string")
    end

    context "right shift of 3" do
      it "encrypts 'a' to 'd'" do
        cipher = Caesar_Cipher.new(3)
        result = cipher.encrypt("abc")
        expect(result).to eql("def")
      end

    # TODO: encrypt a lower case string of one word
    # TODO: encrypt an upper case string of one word
    # TODO: encrypt a mix of upper and lower case in one word
    # TODO: preserve characters that are not letters (spaces, commas etc...) 
    # TODO: encrypt 'What a string!"
    end

    # TODO: shift of 22 and -3 are the same
  end
end
