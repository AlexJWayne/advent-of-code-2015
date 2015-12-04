class FloorDirections
  def initialize(directions)
    @directions = process_input directions
  end

  def find_floor
    @directions.reduce :+
  end

  def enter_basement
    floor = 0
    @directions.each_with_index do |value, i|
      floor += value
      return i + 1 if floor < 0
    end
    false
  end

  private
  def process_input(directions)
    directions.split('').map do |char|
      char == '(' ? 1 : -1
    end
  end
end

if __FILE__ == $0
  input = File.read File.expand_path('../input.txt', __FILE__)
  directions = FloorDirections.new(input)
  puts "Ends up on floor #{ directions.find_floor }"
  puts "First enters basement at step #{ directions.enter_basement }"
end
