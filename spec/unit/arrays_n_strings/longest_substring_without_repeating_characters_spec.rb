# frozen_string_literal: true

require 'arrays_n_strings/longest_substring_without_repeating_characters'

RSpec.describe LongestSubstringWithoutRepeatingCharacters do
  cases = {
    'abcabcbb' => [3, 'abc'],
    'bbbbb' => [1, 'b'],
    'pwwkew' => [3, 'wke'],
    ' ' => [1, ' '],
    'dvdf' => [3, 'vdf'],
    'dvdvf' => [3, 'dvf']
  }

  cases.each do |input, expected|
    it "when the input is #{input.inspect}" do
      expect(described_class.length_of_longest_substring(input, debug: true)).to eq(expected)
    end
  end

  it 'works without debug set' do
    expect(described_class.length_of_longest_substring('bbbbb')).to eq(1)
  end

  context 'when we use the best implementation from LeetCode' do
    cases.each do |input, expected|
      it "when the input is #{input.inspect}" do
        expect(described_class.best_length_of_longest_substring(input)).to eq(expected.first)
      end
    end
  end
end
