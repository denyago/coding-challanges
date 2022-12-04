# frozen_string_literal: true

module LongestPalindromicSubstring
  # @param [String] string
  # @return [String]
  def self.longest_palindrome(string)
    return string if non_trivial_palindrome(string)

    # 0. If not palindromes, at least the first character is one.
    longest = string[0].to_s

    # @type [Array<Integer>]
    double_indexes = []

    # @type [Array<Integer>]
    tripple_indexes = []

    # 1. Find double palindromes like `bb` and triple like `bbb`
    # Use a sliding window of 3 to iterate over the string.
    # In Ruby, no worries if the index is out of bounds:
    #   "abc"[2..3] #=> "c"
    #   "abc"[3..4] #=> ""
    first_index = 0
    while first_index < string.size
      maybe_tripple = string[first_index..first_index + 2]
      # Size checks if the index is out of bound
      tripple_indexes << first_index if maybe_tripple.size == 3 && non_trivial_palindrome(maybe_tripple)

      maybe_double = string[first_index..first_index + 1]
      double_indexes << first_index if maybe_double.size == 2 && non_trivial_palindrome(maybe_double)
      first_index += 1
    end

    # puts "Double: #{double_indexes.inspect}"
    # puts "Tripple: #{tripple_indexes.inspect}"

    # Check by expanding left and right until we hit the beginning or the end of
    # the string.
    tripple_indexes.each do |index|
      longest = string[index..index + 2] if longest.size < 3
      beginning = index - 1
      ending = index + 3
      # The core optimization if: we don't need to check the whole string[beginning..ending]
      # as we have done it already. We need to make sure that the edges are same. If they are
      # it's also a palindrome and we proceed until it's not.
      while string[beginning] == string[ending]
        longest = string[beginning..ending] if string[beginning..ending].size > longest.size
        break if beginning.zero? || ending == string.size

        beginning -= 1
        ending += 1
      end
    end

    # We should check doubles too. Maybe an 'extended' palindrome from one of doubles would
    # overweight a longest extended from triple before.
    double_indexes.each do |index|
      longest = string[index..index + 1] if longest.size < 2
      beginning = index - 1
      ending = index + 2
      while string[beginning] == string[ending]
        longest = string[beginning..ending] if string[beginning..ending].size > longest.size
        break if beginning.zero? || ending == string.size

        beginning -= 1
        ending += 1
      end
    end

    longest
  end

  # @param [String] string
  # @return [Boolean]
  def self.non_trivial_palindrome(string)
    return false if string.empty?

    string[0..(string.size / 2) - 1].each_char.with_index.none? { |c, i| c != string[-1 * (i + 1)] }
  end
end
