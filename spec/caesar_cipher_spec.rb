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

    context "right shift of 1" do
      it "encrypts 'a' to 'b'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("a")
        expect(result).to eql("b")
      end

      it "encrypts 'z' to 'a'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("z")
        expect(result).to eql("a")
      end

      it "encrypts 'A' to 'B'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("A")
        expect(result).to eql("B")
      end

      it "encrypts 'Z' to 'A'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("A")
        expect(result).to eql("B")
      end

      it "encrypts a lowercase string" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("abc")
        expect(result).to eql("bcd")
      end

      it "encrypts a lowercase string with wraparound" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("xyz")
        expect(result).to eql("yza")
      end

      it "encrypts an uppercase string" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("ABC")
        expect(result).to eql("BCD")
      end

      it "encrypts an uppercase string with wraparound" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt("XYZ")
        expect(result).to eql("YZA")
      end

    # TODO: encrypt a mix of upper and lower case in one word
    # TODO: preserve characters that are not letters (spaces, commas etc...) 
    # TODO: encrypt 'What a string!"
    end

  end
end
