# frozen_string_literal: true

# Inspired by https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/781/discuss/270884/Python-2-solutions:-Right-So-Far-One-pass-O(1)-Space-Clean-and-Concise
# (solution 2).
module IncreasingTripletSubsequence
  # @param [Array<Integer>] nums
  # @return [Boolean]
  def self.increasing_triplet(nums)
    first = second = Float::INFINITY
    nums.each do |num|
      if num <= first
        first = num
      elsif num <= second # Now first < num, if num <= second then try to make `second` as small as possible
        second = num
      else  # Now first < second < num
        return true
      end
    end
    false
  end
end
