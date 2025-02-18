require './lib/caesar_cipher'

describe Caesar_Cipher do
  describe '#initialize' do
    it 'sets the instance value of right shift' do
      cipher = Caesar_Cipher.new(3)
      expect(cipher.right_shift).to eql(3)
    end

    it 'does not accept a value less than 1' do
      expect { Caesar_Cipher.new(0) }.to raise_error ArgumentError
    end

    it 'does not accept a value greater than 25' do
      expect { Caesar_Cipher.new(26) }.to raise_error ArgumentError
    end
  end

  describe '#encrypt' do
    context 'invalid input' do
      it 'returns an error when a string is not passed in' do
        cipher = Caesar_Cipher.new(3)
        expect { cipher.encrypt(42) }.to raise_error ArgumentError
      end

      it 'ciphertext is an empty string when the plaintext is an empty string' do
        cipher = Caesar_Cipher.new(3)
        result = cipher.encrypt('')
        expect(result).to eql('')
      end
    end

    context 'happy path, right shift of 1' do
      it "encrypts 'a' to 'b'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('a')
        expect(result).to eql('b')
      end

      it "encrypts 'z' to 'a'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('z')
        expect(result).to eql('a')
      end

      it "encrypts 'A' to 'B'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('A')
        expect(result).to eql('B')
      end

      it "encrypts 'Z' to 'A'" do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('A')
        expect(result).to eql('B')
      end

      it 'encrypts a lowercase string' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('abc')
        expect(result).to eql('bcd')
      end

      it 'encrypts a lowercase string with wraparound' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('xyz')
        expect(result).to eql('yza')
      end

      it 'encrypts an uppercase string' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('ABC')
        expect(result).to eql('BCD')
      end

      it 'encrypts an uppercase string with wraparound' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('XYZ')
        expect(result).to eql('YZA')
      end

      it 'encrypts a word with upper and lowercase' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('aBc')
        expect(result).to eql('bCd')
      end

      it 'encrypts a word with upper and lowercase and wraparound' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('zZa')
        expect(result).to eql('aAb')
      end

      it 'preserves non-alphabetic characters' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt(' !,')
        expect(result).to eql(' !,')
      end

      it 'encrypts multiple words and punctiuation' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.encrypt('What a string!')
        expect(result).to eql('Xibu b tusjoh!')
      end
    end
  end

  describe 'decrypt' do
    context 'invalid input' do
      it 'returns an error when a string is not passed in' do
        cipher = Caesar_Cipher.new(3)
        expect { cipher.decrypt(42) }.to raise_error ArgumentError
      end

      it 'ciphertext is an empty string when the plaintext is an empty string' do
        cipher = Caesar_Cipher.new(3)
        result = cipher.decrypt('')
        expect(result).to eql('')
      end
    end

    context 'right shift of 1' do
      it 'decrypts multiple words and punctiuation' do
        cipher = Caesar_Cipher.new(1)
        result = cipher.decrypt('Xibu b tusjoh!')
        expect(result).to eql('What a string!')
      end
    end
  end
end
