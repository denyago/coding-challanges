# frozen_string_literal: true

require 'set'

# Given an integer array nums, return all the triplets
# `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`,
# and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.
# Notice that the solution set must not contain duplicate triplets.
module ThreeSum
  # Inspired by https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/776/discuss/725950/Python-5-Easy-Steps-Beats-97.4-Annotated
  # @param {Integer[]} nums
  # @return {Integer[][]}
  def self.three_sum(nums = [])
    res = Set.new

    # 1. Split nums into three lists: negative numbers, positive numbers, and zeros
    negatives = []
    positives = []
    zeros = []
    nums.each do |n|
      if n.zero?
        zeros << n
      elsif n.positive?
        positives << n
      else
        negatives << n
      end
    end

    # 2. Create a separate set for negatives and positives for O(1) look-up times
    negatives_set = Set.new(negatives)
    positives_set = Set.new(positives)

    # 3. If there is at least 1 zero in the list, add all cases where -num exists in N and num exists in P
    #   i.e. (-3, 0, 3) = 0
    unless zeros.empty?
      positives_set.each do |p|
        res << [-1 * p, 0, p] if negatives_set.include?(-1 * p)
      end
    end

    # 3. If there are at least 3 zeros in the list then also include (0, 0, 0) = 0
    res << [0, 0, 0] if zeros.size >= 3

    # 4. For all pairs of negative numbers (-3, -1), check to see if their complement (4)
    #   exists in the positive number set
    negatives[0..-2].each_with_index do |first_number, index|
      negatives[index + 1..].each do |second_number|
        target = -1 * (first_number + second_number)
        res << [first_number, second_number, target].sort if positives_set.include?(target)
      end
    end

    # 5. For all pairs of positive numbers (1, 1), check to see if their complement (-2)
    #   exists in the negative number set
    positives[0..-2].each_with_index do |first_number, index|
      positives[index + 1..].each do |second_number|
        target = -1 * (first_number + second_number)
        res << [target, first_number, second_number].sort if negatives_set.include?(target)
      end
    end

    res.to_a
  end
end
