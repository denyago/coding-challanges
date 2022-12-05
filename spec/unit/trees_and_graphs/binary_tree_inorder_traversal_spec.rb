# frozen_string_literal: true

# TODO: `dotfiles` Solargraph does not pick those,
# although it is not highlighting an issue
require_relative '../../../lib/trees_and_graphs/binary_tree_inorder_traversal'
require_relative '../../../lib/trees_and_graphs/tree_node'

RSpec.describe BinaryTreeInorderTraversal do
  cases = {
    TN[1, nil, TN[2, TN[3]]] => [1, 3, 2],
    TN[] => [],
    TN[0] => [0],
    TN[3, TN[9, TN[41], TN[42]], TN[20, TN[15], TN[7]]] => [41, 9, 42, 3, 15, 20, 7]
  }

  cases.each do |input, expected|
    it "when the input is #{input} it's #{expected}" do
      expect(described_class.inorder_traversal(input)).to eq(expected)
    end
  end
end
