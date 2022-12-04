# frozen_string_literal: true

require 'linked_list/list_node'

module IntersectionOfTwoLinkedLists
  # @param [ListNode] headA
  # @param [ListNode] headB
  # @return [ListNode]
  # LeetCode API compatibility.
  # rubocop:disable Naming/MethodName
  # rubocop:disable Naming/MethodParameterName
  # rubocop:disable Naming/VariableName
  def self.getIntersectionNode(headA, headB)
    headA.val + headB.val
  end
  # rubocop:enable Naming/MethodName
  # rubocop:enable Naming/MethodParameterName
  # rubocop:enable Naming/VariableName
end
