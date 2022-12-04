# frozen_string_literal: true

module CountAndSay
  # @param [Integer] iterations
  # @return [String]
  def self.count_and_say(iterations)
    result = '1'

    (iterations - 1).times do
      result = to_string(parse(result))
    end

    result
  end

  def self.parse(string)
    # [ it's count, type of number ]
    acc = [[1, string[0]]]
    string[1..].each_char do |n|
      # Last type of character is the same
      if acc.last.last == n
        acc.last[0] += 1
      else
        acc << [1, n]
      end
    end
    acc
  end

  def self.to_string(array)
    array.join(&:join)
  end
end
