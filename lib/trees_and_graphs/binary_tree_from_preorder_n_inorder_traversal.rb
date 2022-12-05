# frozen_string_literal: true

require_relative 'tree_node'

# Inspired by https://leetcode.com/explore/interview/card/top-interview-questions-medium/108/trees-and-graphs/788/discuss/2279613/C++-or-Recursive-and-Using-Map-Approaches
# Time and Space complexity is `O(n)` as we are using a helper
# Hash for the `inorder` traversal data.
module BinaryTreeFromPreorderNInorderTraversal
  # @param [Array<Integer>] preorder
  # @param [Array<Integer>] inorder
  # @return [TreeNode]
  def self.build_tree(preorder, inorder)
    # We can find element's index in `0(1)`
    inorder_lookup = inorder.each_with_index.inject({}) { |acc, (n, i)| acc.merge({ n => i }) }
    from_root_and_subtries(preorder, 0, preorder.size - 1, inorder, 0, inorder.size - 1, inorder_lookup)
  end

  # rubocop:disable Metrics/ParameterLists
  def self.from_root_and_subtries(preorder, start_preorder_index, max_preorder_index,
                                  inorder, start_inorder_index, max_inorder_index,
                                  inorder_lookup)
    return nil if start_preorder_index > max_preorder_index || start_inorder_index > max_inorder_index

    root = TreeNode.new(preorder[start_preorder_index])
    inorder_index_of_root = inorder_lookup[root.val]
    numbers_left = inorder_index_of_root - start_inorder_index

    root.left = from_root_and_subtries(preorder, start_preorder_index + 1, start_preorder_index + numbers_left,
                                       inorder, start_inorder_index, inorder_index_of_root - 1, inorder_lookup)
    root.right = from_root_and_subtries(preorder, start_preorder_index + numbers_left + 1, max_preorder_index,
                                        inorder, inorder_index_of_root + 1, max_inorder_index, inorder_lookup)

    root
  end
  # rubocop:enable Metrics/ParameterLists
end
