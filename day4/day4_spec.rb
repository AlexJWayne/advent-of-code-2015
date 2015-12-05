require 'rspec'
include RSpec

require_relative './day4'

describe Day4 do
  describe '#lowest_number' do
    it 'returns the lowest number that hases to a result of the first five zeros' do
      expect(Day4.new('abcdef').lowest_number).to equal(609043)
      expect(Day4.new('pqrstuv').lowest_number).to equal(1048970)
    end
  end
end
