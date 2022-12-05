# frozen_string_literal: true

require 'trees_and_graphs/binary_tree_from_preorder_n_inorder_traversal'

RSpec.describe BinaryTreeFromPreorderNInorderTraversal do
  cases = {
    {
      preorder: [3, 9, 1, 2, 20, 15, 7],
      inorder: [1, 9, 2, 3, 15, 20, 7]
    } => TN[3, TN[9, TN[1], TN[2]], TN[20, TN[15], TN[7]]]
  }

  cases.each do |input, expected|
    it "when the input is #{input[:preorder]} and #{input[:inorder]} it's #{expected}" do
      expect(described_class.build_tree(input[:preorder], input[:inorder])).to eq(expected)
    end
  end
end
