# frozen_string_literal: true

require 'linked_list/list_node'

RSpec.describe ListNode do
  describe '.[]' do
    it 'constructs a List of nodes' do
      expect(described_class[1, 2, 3]).to eq(described_class.new(1, described_class.new(2, described_class.new(3))))
    end
  end

  describe '#inspect' do
    it 'shows a useful string representation' do
      expect(described_class[1, 2].inspect).to eq('<ListNode: val: 1, next: <ListNode: val: 2, next: nil>>')
    end
  end

  describe '#to_s' do
    it 'shows a short string representation' do
      expect(described_class[1, 2, 3].to_s).to eq('ListNode[1, 2, 3]')
    end
  end

  describe '#+' do
    it 'adds two lists' do
      expect(described_class[1, 2, 3] + described_class[4, 5, 6]).to eq(described_class[1, 2, 3, 4, 5, 6])
    end
  end

  describe '#[]' do
    it 'returns a ListNode at the given positon' do
      expect(described_class[1, 2, 3, 4][2]).to eq(described_class[3, 4])
    end

    it 'returns a ListNode::EMPTY ia the given position when it is out of bounds' do
      expect(described_class[1, 2][2]).to eq(ListNode::EMPTY)
    end
  end

  describe '#==' do
    let(:the_list) { described_class[1, 2] }

    it 'is true when comparing to the same list' do
      expect(the_list == described_class[1, 2]).to be(true)
    end

    it 'is false when comparing with a different list' do
      expect(the_list == described_class[1, 3]).to be(false)
    end

    it 'is false then comparing with anything else' do
      expect(the_list == [1, 2]).to be(false)
    end
  end
end
