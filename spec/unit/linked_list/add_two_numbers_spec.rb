# frozen_string_literal: true

require 'linked_list/add_two_numbers'

RSpec.describe AddTwoNumbers do
  cases = {
    { l1: ListNode[2, 4, 3], l2: ListNode[5, 6, 4] } => ListNode[7, 0, 8],
    { l1: ListNode[0], l2: ListNode[0] } => ListNode[0],
    { l1: ListNode[9, 9, 9, 9, 9, 9, 9], l2: ListNode[9, 9, 9, 9] } => ListNode[8, 9, 9, 9, 0, 0, 0, 1]
  }

  cases.each do |input, expected|
    it "when the input is #{input[:l1]} and #{input[:l2]} it's #{expected}" do
      expect(described_class.add_two_numbers(input[:l1], input[:l2])).to eq(expected)
    end
  end
end
