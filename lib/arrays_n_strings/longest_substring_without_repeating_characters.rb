# frozen_string_literal: false

# Given a string `s`, find the length of the longest substring without repeating characters.
# Constraints:
#   - `0 <= s.length <= 5 * 104`
#   - `s` consists of English letters, digits, symbols and spaces.
module LongestSubstringWithoutRepeatingCharacters
  # rubocop:disable Naming/MethodParameterName
  # @param {String} s
  # @return {Integer}
  def self.length_of_longest_substring(s = '', debug: false)
    longest = {}

    last_result = s.chars.each_with_index.inject({}) do |acc, (c, i)|
      if acc.values.include?(c)
        longest = acc if longest.size < acc.size
        previous_character_index = acc.select { |_, v| v == c }.keys.max
        acc.drop_while { |k, _| k <= previous_character_index }.to_h.merge(i => c)
      else
        acc[i] = c
        acc
      end
    end
    longest = last_result if longest.size < last_result.size

    if debug
      [longest.size, longest.values.join]
    else
      longest.size
    end
  end

  # Best time solution - https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/853529665/
  def self.best_length_of_longest_substring(s)
    return 0 if s.length.zero?
    return 1 if s.length == 1

    current_max = 0

    test = ''
    s.each_char do |char|
      test = test[test.index(char) + 1..] if test.include? char
      test << char
      current_max = [test.size, current_max].max
    end
    current_max
  end
  # rubocop:enable Naming/MethodParameterName
end
