# frozen_string_literal: true

require 'arrays_n_strings/increasing_triplet_subsequence'

RSpec.describe IncreasingTripletSubsequence do
  cases = {
    [1, 2, 3, 4, 5] => true,
    [5, 4, 3, 2, 1] => false,
    [2, 1, 5, 0, 4, 6] => true
  }

  cases.each do |input, expected|
    it "when the input is #{input[0..50].inspect}... it's #{expected.inspect}" do
      expect(described_class.increasing_triplet(input)).to eq(expected)
    end
  end
end
