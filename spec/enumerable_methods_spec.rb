require "./lib/enumerable_methods.rb"

describe Enumerable do
  include Enumerable
  
  describe "#my_all" do
    it "returns true when all array elements are of the same type" do
      expect([1,2,3,4,5].my_all? { |n| n.is_a?(Integer) }).to eql(true)
    end
    it "returns false when all array elements are not of the same type" do
      expect([1,2,"3",4,5].my_all? { |n| n.is_a?(Integer) }).to eql(false)
    end
  end

  describe "#my_select" do
    it "returns an array of values that match the block condition" do
      expect([1,2,3,4,5,6].my_select {|n| n % 2 == 0}).to eql([2,4,6])
    end
    it "returns an empty array if there are no matches" do
      expect([1,2,3,4,5,6].my_select {|n| n > 6}).to eql([])
    end
  end

  describe "#my_any" do
    it "returns true if at least one value that matches the condition" do
      expect([1,2,3,4,5,6].my_any? {|n| n == 3}).to eql(true)
    end
    it "returns fase if no value match the condition" do
      expect([1,2,4,4,5,6].my_any? {|n| n == 3}).to eql(false)
    end
  end

  describe "#my_inject" do
    it "returns the sum of the values in the array" do
      expect([1,2,3].my_inject {|sum, n| sum + n}).to eql(6)
    end
    it "works to concatinate strings" do
      expect(["1","2","3"].my_inject {|sum, n| sum + n}).to eql("123")
    end
  end

end