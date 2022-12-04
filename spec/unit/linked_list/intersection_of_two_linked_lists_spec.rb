# frozen_string_literal: true

require 'linked_list/intersection_of_two_linked_lists'

RSpec.describe IntersectionOfTwoLinkedLists do
  cases = {
    { l1: ListNode[4, 1, 8, 4, 5], l2: ListNode[5, 6, 1], l1_position: 2 } => 8,
    { l1: ListNode[1, 9, 1, 2, 4], l2: ListNode[3], l1_position: 3 } => 2,
    { l1: ListNode[2, 6, 4], l2: ListNode[1, 5], l1_position: :none } => 0
  }

  cases.each do |input, expected|
    # LeetCode API compatibility.
    # rubocop:disable Naming/VariableName
    # rubocop:disable RSpec/ExampleLength
    it "when the input is #{input[:l1] || '[]'} and #{input[:l2] || []} " \
       "merged at #{input[:l1_position]} it's #{expected || '[]'}" do
         pending("Will do tomorrow")
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
