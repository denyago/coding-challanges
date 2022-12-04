# frozen_string_literal: true

require 'linked_list/list_node'

module OddEvenLinkedList
  # @param [ListNode] head
  # @return [ListNode]
  # rubocop:disable Metrics/ParameterLists
  def self.odd_even_list(head, position = 1,
                         odd_list_head = nil, odd_list_tail = nil,
                         even_list_head = nil, even_list_tail = nil)
    if head.nil?
      return nil if odd_list_head.nil?

      odd_list_tail.next = even_list_head
      return odd_list_head
    end

    node = ListNode.new(head.val)
    if position.odd?
      if odd_list_head.nil?
        odd_even_list(head.next, position + 1, node, node, even_list_head, even_list_tail)
      else
        odd_list_tail.next = node
        odd_even_list(head.next, position + 1, odd_list_head, node, even_list_head, even_list_tail)
      end
    else
      # Just for clarity of reading the code
      if even_list_head.nil? # rubocop:disable Style/IfInsideElse
        odd_even_list(head.next, position + 1, odd_list_head, odd_list_tail, node, node)
      else
        even_list_tail.next = node
        odd_even_list(head.next, position + 1, odd_list_head, odd_list_tail, even_list_head, node)
      end
    end
  end
  # rubocop:enable Metrics/ParameterLists
end
