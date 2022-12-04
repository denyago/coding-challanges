# frozen_string_literal: true

require 'arrays_n_strings/count_and_say'

RSpec.describe CountAndSay do
  cases = {
    1 => '1',
    2 => '11',
    3 => '21',
    4 => '1211'
  }

  cases.each do |input, expected|
    it "when the input is #{input.inspect}... it's #{expected.inspect}" do
      expect(described_class.count_and_say(input)).to eq(expected)
    end
  end

  describe '#parse' do
    it 'parses string into set of characters' do
      expect(described_class.parse('223314444411')).to eq([[2, '2'], [2, '3'], [1, '1'], [5, '4'], [2, '1']])
    end
  end

  describe '#to_string' do
    it 'makes a string from the set of characters' do
      expect(described_class.to_string([[2, '2'], [2, '3'], [1, '1'], [5, '4'], [2, '1']])).to eq('2223115421')
    end
  end
end
