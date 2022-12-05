# frozen_string_literal: true

# TODO: `dotfiles` Solargraph does not pick those,
# although it is not highlighting an issue
require 'trees_and_graphs/binary_tree_zigzag_level_order_traversal'

RSpec.describe BinaryTreeZigzagLevelOrderTraversal do
  cases = {
    TN[3, TN[9], TN[20, TN[15], TN[7]]] => [[3], [20, 9], [15, 7]],
    TN[] => [],
    TN[1] => [[1]],
    nil => []
  }

  cases.each do |input, expected|
    it "when the input is #{input} it's #{expected}" do
      expect(described_class.zigzag_level_order(input)).to eq(expected)
    end
  end
end
