# frozen_string_literal: true

require 'linked_list/list_node'

module IntersectionOfTwoLinkedLists
  # Inspired by https://leetcode.com/explore/interview/card/top-interview-questions-medium/107/linked-list/785/discuss/2116221/Visual-Explanation-or-One-Pass-JAVA
  # Align lists so we have A+B and B+A. Loop until we get the same element.
  # Given this combination, we now have the lists of the same length with
  # some "insignificant additions" in the beginning.
  # @param [ListNode] headA
  # @param [ListNode] headB
  # @return [ListNode]
  # LeetCode API compatibility.
  # rubocop:disable Naming/MethodName
  # rubocop:disable Naming/MethodParameterName
  # rubocop:disable Naming/VariableName
  def self.getIntersectionNode(headA, headB)
    return nil if headA.nil? || headB.nil?

    ptr_a = headA
    ptr_b = headB
    # loop until we found the first common node
    while ptr_a.object_id != ptr_b.object_id
      ptr_a = ptr_a.nil? ? headB : ptr_a.next # once we're done with A, move to B
      ptr_b = ptr_b.nil? ? headA : ptr_b.next # once we're done with B, move to A
    end

    # If nothing found, it's nil in the end
    ptr_a
  end
  # rubocop:enable Naming/MethodName
  # rubocop:enable Naming/MethodParameterName
  # rubocop:enable Naming/VariableName
end
