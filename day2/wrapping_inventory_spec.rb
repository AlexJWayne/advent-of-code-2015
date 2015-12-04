require 'rspec'
include RSpec

require_relative './wrapping_inventory'

describe WrappingInventory do
  describe '.required_paper' do
    it 'returns the total amount of wrapping paper needed for all presents' do
      list = <<-PACKAGELIST
        2x3x4
        1x2x3
      PACKAGELIST

      inv = WrappingInventory.new list
      expect(inv.required_paper).to equal(82)
    end
  end

  describe '.required_paper_for_package' do
    it "returns the square feet of paper required to wrap a present" do
      inv = WrappingInventory.new ''
      expect(inv.required_paper_for_package [2, 3, 4]).to equal(58)
    end
  end

  describe '.required_ribbon' do
    it 'returns the total amount of ribbon needed for all presents' do
      list = <<-PACKAGELIST
        2x3x4
        1x1x10
      PACKAGELIST

      inv = WrappingInventory.new list
      expect(inv.required_ribbon).to equal(48)
    end
  end

  describe '.required_ribbon_for_package' do
    it "returns the length of ribbon required to wrap a present" do
      inv = WrappingInventory.new ''
      expect(inv.required_ribbon_for_package [2, 3, 4]).to equal(34)
    end
  end
end
