# frozen_string_literal: true

# TODO: My `dotfiles` - Solargraph can't see requires (even explicit)
# Looks like it can't detect the project root or something
# TODO: My `dotfiles` - path autocomplete doesn't pick up the path in '', or "". Picks up w/o quotes.
require 'spec_helper'
require 'arrays_n_strings/set_matrix_zeroes'

RSpec.describe SetMatrixZeroes do
  {
    [[1, 1, 1], [1, 0, 1], [1, 1, 1]] => [[1, 0, 1], [0, 0, 0], [1, 0, 1]],
    [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]] => [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]
  }.each do |input, expected|
    it "when the input is #{input.inspect}" do
      expect(described_class.set_zeroes(input).sort).to match_array(expected.sort)
    end
  end
end
