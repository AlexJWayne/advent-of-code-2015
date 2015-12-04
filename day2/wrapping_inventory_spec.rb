require 'rspec'
include RSpec

require_relative './wrapping_inventory'

describe WrappingInventory do
  describe '.required_paper_for_package_list' do
    it 'returns the total amount of wrapping paper needed for a text list of package dimensions' do
      list = <<-PACKAGELIST
        2x3x4
        1x2x3
      PACKAGELIST

      expect(WrappingInventory.required_paper_for_package_list list).to equal(82)
    end
  end

  describe '.required_paper_for_package' do
    it "returns the square feet of paper required to wrap a present" do
      expect(WrappingInventory.required_paper_for_package 2,3,4).to equal(58)
    end
  end
end
