class WrappingInventory

  # Create a new WrappingInventory from a text list of package dimensions.
  def initialize(package_list)
    @packages = process_input package_list
  end

  # Returns the amount of paper required to wrap all presents.
  def required_paper
    sum do |dimensions|
      required_paper_for_package dimensions
    end
  end

  # Returns the amount of paper required to wrap one present of [w, l, h] dimensions.
  def required_paper_for_package(dimensions = [])
    w, l, h = dimensions

    # Get the area of each side twice to cover the whole box.
    sides = [
      w * l,
      w * h,
      l * h
    ] * 2

    # Add again the smallest side.
    sides << sides.min

    # Sum the area of each segment.
    sides.reduce :+
  end

  # Returns the amount of ribbon required to wrap all presents.
  def required_ribbon
    sum do |dimensions|
      required_ribbon_for_package dimensions
    end
  end

  # Returns the amount of ribbon required to wrap one present of [w, l, h] dimensions.
  def required_ribbon_for_package(dimensions)
    w, l = dimensions

    # Calucalate the smallest perimiter from the two shortest dimensions.
    ribbon = (w + l) * 2

    # Add in the volume of the package.
    ribbon += dimensions.reduce(:*)

    # Return the result!
    ribbon
  end

  private
    def process_input(package_list)
      package_list.split("\n").map do |line|
        line.split('x').map(&:to_i).sort
      end
    end

    def sum
      @packages.reduce(0) do |total, dimensions|
        total + yield(dimensions)
      end
    end
end

# When this file is run directly, do the execerise!
if __FILE__ == $0
  input = File.read File.expand_path('../input.txt', __FILE__)
  inv = WrappingInventory.new input
  puts "We need #{ inv.required_paper } square feet of wrapping paper"
  puts "We need #{ inv.required_ribbon } feet of ribbon"
end
