# frozen_string_literal: true

class ListNode
  attr_accessor :val, :next_node

  def self.[](*elements)
    new(elements.first).tap do |first_node|
      elements[1..].inject(first_node) do |acc, e|
        new(e).tap { |n| acc.next_node = n }
      end
    end
  end

  EMPTY = nil

  # API compatibility for LeetCode
  # ListNode class.
  def next
    next_node
  end

  def next=(node)
    @next_node = node
  end

  def initialize(val = 0, next_node = nil)
    @val = val
    @next_node = next_node
  end

  def inspect
    "<ListNode: val: #{val}, next: #{next_node.nil? ? 'nil' : next_node.inspect}>"
  end

  def to_s(leader = 'ListNode[')
    leader + val.to_s + (next_node.nil? ? ']' : next_node.to_s(', '))
  end

  def ==(other)
    return false unless other.is_a?(self.class)

    val == other.val && next_node == other.next_node
  end
end
