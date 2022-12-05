# frozen_string_literal: true

require 'linked_list/intersection_of_two_linked_lists'

RSpec.describe IntersectionOfTwoLinkedLists do
  cases = {
    { l1: ListNode[4, 1, 8, 4, 5], l2: ListNode[5, 6, 1], l1_position: 2 } => ListNode[8, 4, 5],
    { l1: ListNode[1, 9, 1, 2, 4], l2: ListNode[3], l1_position: 3 } => ListNode[2, 4],
    { l1: ListNode[2, 6, 4], l2: ListNode[1, 5], l1_position: :none } => nil,
    { l1: ListNode::EMPTY, l2: ListNode[1, 5], l1_position: :none } => nil,
    { l1: ListNode[2, 6, 4], l2: ListNode::EMPTY, l1_position: :none } => nil,
    {
      l1: ListNode[*((1..10_000).reject(&:even?) + [10_000])],
      l2: ListNode[*(1..9_999).reject(&:odd?)],
      l1_position: 5_000
    } => ListNode[10_000]
  }

  cases.each do |input, expected|
    # LeetCode API compatibility.
    # rubocop:disable Naming/VariableName
    # rubocop:disable RSpec/ExampleLength
    it "when the input is #{input[:l1].to_s[0..100] || '[]'} and #{input[:l2].to_s[0..100] || '[]'} " \
       "merged at #{input[:l1_position]} it's #{expected || '[]'}" do
      headA = input[:l1]
      headB = if input[:l1_position] == :none
                input[:l2]
              else
                input[:l2] + headA[input[:l1_position]]
              end
      expect(described_class.getIntersectionNode(headA, headB)).to eq(expected)
    end
    # rubocop:enable Naming/VariableName
    # rubocop:enable RSpec/ExampleLength
  end
end
