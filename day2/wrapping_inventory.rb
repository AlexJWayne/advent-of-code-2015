module WrappingInventory
  def self.required_paper_for_package_list(list)
    packages = list.split("\n")

    packages.reduce(0) do |total, package|
      dimensions = package.split('x').map(&:to_i)
      total + required_paper_for_package(dimensions[0], dimensions[1], dimensions[2])
    end
  end

  def self.required_paper_for_package(w, l, h)
    # Get the area of each side twice to cover the whole box.
    sides = [w * l, w * h, l * h] * 2

    # Add again the smallest side.
    sides << sides.min

    # Sum the area of each segment.
    sides.reduce :+
  end
end

# When this file is run directly, do the execerise!
if __FILE__ == $0
  input = File.read File.expand_path('../input.txt', __FILE__)
  puts "We need #{ WrappingInventory.required_paper_for_package_list input } square feet of wrapping paper"
end
