# frozen_string_literal: true

require_relative 'tree_node'

module BinaryTreeZigzagLevelOrderTraversal
  # @param [TreeNode] root
  # @return [Array<Array<Integer>>]
  def self.zigzag_level_order(root)
    return [] if root&.val.nil?

    levels = Hash.new([])
    stack = []

    current_node = root
    level = 1
    until current_node.nil? && stack.empty?
      until current_node.nil?
        # puts "[#{stack.map { |(n, l)| "[#{n&.val}, #{l}]" }}] << [#{current_node&.val}, #{level}]"
        stack.push([current_node, level])
        current_node = current_node.left
        level += 1
      end
      current_node, level = stack.pop
      levels[level] = \
        if level.odd?
          levels[level] + [current_node.val]
        else
          [current_node.val] + levels[level]
        end
      # puts levels.inspect
      current_node = current_node.right
      level += 1
    end

    (1..levels.size).inject([]) do |acc, l|
      acc << levels[l]
    end
  end
end
