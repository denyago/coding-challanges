# frozen_string_literal: true

class TreeNode
  attr_accessor :val, :left, :right

  # API example:
  #
  #   TN[1, nil, TN[2, TN[3]]]
  #
  def self.[](*data)
    raise ArgumentError, "Only 3 elements supported: val, left and right. #{data.size} found" if data.size > 3

    new(data[0], data[1], data[2])
  end

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  DOT_HELP = 'Paste the Dot code here: http://magjac.com/graphviz-visual-editor/'

  # API example:
  #
  #   Paste the Dot code here: http://magjac.com/graphviz-visual-editor/
  #   digraph D {
  #     1 -> nil_1_l
  #     1 -> 2
  #     2 -> 3
  #     2 -> nil_2_r
  #   }
  #
  def to_dot(root: true)
    (root ? "#{DOT_HELP}\ndigraph D {" : '') +
      left&.to_dot(root: false).to_s +
      (
       if !left.nil? || !right.nil?
         "\n  #{val} -> #{left&.val || "nil_#{val}_l"}".to_s +
         "\n  #{val} -> #{right&.val || "nil_#{val}_r"}".to_s
       end
     ).to_s +
      right&.to_dot(root: false).to_s +
      (root ? "\n}" : '')
  end

  def to_s
    "#{["TN[#{val}", left.to_s, right.to_s].reject(&:empty?).join(', ')}]"
  end

  def ==(other)
    return false \
      unless other.respond_to?(:val) && \
             other.respond_to?(:left) && \
             other.respond_to?(:right)

    val == other&.val &&
      left == other&.left &&
      right == other&.right
  end
end

# Alias for TreeNode
TN = TreeNode
