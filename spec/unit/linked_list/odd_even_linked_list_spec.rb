# frozen_string_literal: true

require 'linked_list/odd_even_linked_list'

RSpec.describe OddEvenLinkedList do
  cases = {
    ListNode[1, 2, 3, 4, 5] => ListNode[1, 3, 5, 2, 4],
    ListNode[2, 1, 3, 5, 6, 4, 7] => ListNode[2, 3, 6, 7, 1, 5, 4],
    ListNode.new => ListNode.new,
    ListNode::EMPTY => ListNode::EMPTY
  }

  cases.each do |input, expected|
    it "when the input is #{input || '[]'} it's #{expected || '[]'}" do
      expect(described_class.odd_even_list(input)).to eq(expected)
    end
  end
end
