require "./lib/caesar.rb"

describe Caesar do
  include Caesar
  describe "#caesar_cipher" do
    it "shifts a single word" do
      expect(caesar_cipher("Hello", 1)).to eql("Ifmmp")
    end

    it "shifts multiple words" do
      expect(caesar_cipher("Hello There", 1)).to eql("Ifmmp Uifsf")
    end

    it "shifts with negative number" do
      expect(caesar_cipher("Hello There", -1)).to eql("Gdkkn Sgdqd")
    end

    it "loops when large number is given" do
      expect(caesar_cipher("Hello There", 26)).to eql("Hello There")
    end

    it "loops when large negative number is given" do
      expect(caesar_cipher("Hello There", -26)).to eql("Hello There")
    end

  end
end