require 'rspec'
include RSpec

require_relative './floor_directions'

describe FloorDirections do
  describe '#find_floor' do
    it "counts all floors in directions" do
      directions = FloorDirections.new "(())("
      expect(directions.find_floor).to equal 1
    end
  end

  describe '#enter_basement' do
    it "Finds when the basement is entered" do
      directions = FloorDirections.new "())(())"
      expect(directions.enter_basement).to equal 3
    end
  end
end
