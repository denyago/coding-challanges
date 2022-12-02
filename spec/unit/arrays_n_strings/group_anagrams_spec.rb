# frozen_string_literal: true

require 'arrays_n_strings/group_anagrams'

RSpec.describe GroupAnagrams do
  {
    %w[eat tea tan ate nat bat] => [['bat'], %w[nat tan], %w[ate eat tea]],
    [''] => [['']],
    ['a'] => [['a']]
  }.each do |input, expected|
    it "when the input is #{input.inspect}" do
      expect(described_class.group_anagrams(input).map(&:sort).sort).to match_array(expected.map(&:sort).sort)
    end
  end
end
