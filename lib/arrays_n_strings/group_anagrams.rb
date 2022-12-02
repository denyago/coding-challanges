# frozen_string_literal: true

# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
# typically using all the original letters exactly once.
#
# Considerations:
#   - strs[i] consists of lowercase English letters.
#
# We can use `String#bytes` as we are not handling any UTF-8 stuff.
module GroupAnagrams
  # @param strs [Array<String>]
  # @return [Array<Array<String>>]
  def self.group_anagrams(strs = [1, 2, 3])
    strs.group_by { _1.bytes.sort }.values
  end
end
