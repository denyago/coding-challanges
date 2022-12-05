# frozen_string_literal: true

# TODO: `dotfiles` it works this way...
# ...but not with `#require`
require_relative 'tree_node'

# Inspired by https://leetcode.com/explore/interview/card/top-interview-questions-medium/108/trees-and-graphs/786/discuss/2547352/Three-Methods-oror-With-Visualization-oror-Beginner-Friendly
# Iterative approach - Use Stack (Ruby Array is like a stack).
# Push left elements inside until nil, then pop back and go
# to the right and do the same there: push left until nil.
# O(n) space - we kind of having a copy of a Tree.
module BinaryTreeInorderTraversal
  # @param [TreeNode] root
  # @return [Array<Integer>]
  def self.inorder_traversal(root)
    acc = []

    stack = []
    current_node = root

    until current_node.nil? && stack.empty?
      until current_node.nil?
        stack.push(current_node)
        current_node = current_node.left
      end
      current_node = stack.pop
      acc << current_node.val
      current_node = current_node.right
    end

    acc.compact
  end
end
