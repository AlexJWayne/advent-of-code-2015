# Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the
# economically forward-thinking little girls and boys.
#
# To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes.
# The input to the MD5 hash is some secret key (your puzzle input, given below) followed by a
# number in decimal. To mine AdventCoins, you must find Santa the lowest positive number (no
# leading zeroes: 1, 2, 3, ...) that produces such a hash.

require 'digest'

class Day4

  def initialize(secret)
    @secret = process_input secret
  end

  def lowest_number
    mine 5
  end

  def lowest_rare_number
    mine 6
  end

  private
    def process_input(secret)
      secret.chomp.strip
    end

    def mine(zero_count)
      i = 0
      looking_for = /^0{#{zero_count}}/

      loop do
        hash = Digest::MD5.hexdigest "#{@secret}#{i}"
        return i if hash.match looking_for
        i += 1
      end
    end
end

# When this file is run directly, do the execerise!
if __FILE__ == $0
  input = File.read File.expand_path('../input.txt', __FILE__)
  day4 = Day4.new input
  puts "Santa mined the advent coin with ID #{ day4.lowest_number }"
  puts "Santa mined a rare advent coin with ID #{ day4.lowest_rare_number }"
end
