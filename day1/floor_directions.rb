class FloorDirections

  # Accepts a string of "(" and ")" characters, where "(" means
  # to go up a floor, and ")" means to go down.
  def initialize(directions)
    @directions = process_input directions
  end

  # Total the ups and down to find the destination floor.
  def find_floor
    @directions.reduce :+
  end

  # Find the step in the directions that causes you to enter
  # the basement.
  def enter_basement
    floor = 0
    @directions.each_with_index do |value, i|
      floor += value
      return i + 1 if floor < 0
    end
    false
  end

  private

    # Convert a string of ( and ) to an array of +1 and -1 integers.
    # This makes them far easier to enumerate and work with.
    def process_input(directions)
      directions.split('').map do |char|
        char == '(' ? 1 : -1
      end
    end
end

# When this file is run directly, do the execerise!
if __FILE__ == $0
  input = File.read File.expand_path('../input.txt', __FILE__)
  directions = FloorDirections.new(input)
  puts "Ends up on floor #{ directions.find_floor }"
  puts "First enters basement at step #{ directions.enter_basement }"
end
