# frozen_string_literal: true

require 'linked_list/list_node'

module AddTwoNumbers
  # @param [ListNode] list1
  # @param [ListNode] list2
  # @return [ListNode]
  def self.add_two_numbers(list1, list2, carry_over = 0)
    return nil if list1.nil? && list2.nil? && carry_over.zero?

    sum = carry_over
    sum += list1.val unless list1.nil?
    sum += list2.val unless list2.nil?

    if sum > 9
      carry_over = 1
      sum -= 10
    else
      carry_over = 0
    end

    ListNode.new(sum, add_two_numbers(list1&.next, list2&.next, carry_over))
  end
end
