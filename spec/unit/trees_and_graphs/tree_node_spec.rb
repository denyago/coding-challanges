# frozen_string_literal: true

require 'trees_and_graphs/tree_node'

RSpec.describe TreeNode do
  let(:sample_tree) { TN[3, TN[9, TN[1], TN[2]], TN[20, TN[15], TN[7]]] }

  it 'implements #to_s' do
    expect(sample_tree.to_s).to \
      eq('TN[3, TN[9, TN[1], TN[2]], TN[20, TN[15], TN[7]]]')
  end

  describe '#==' do
    # rubocop:disable RSpec/ExampleLength
    it 'returns true for the same tree' do
      tree_copy = described_class.new(
        3,
        described_class.new(
          9,
          described_class.new(1),
          described_class.new(2)
        ),
        described_class.new(
          20,
          described_class.new(15),
          described_class.new(7)
        )
      )
      expect(sample_tree == tree_copy).to be(true)
    end
    # rubocop:enable RSpec/ExampleLength

    it 'returns false for a different tree' do
      expect(sample_tree == TN[1, TN[2], TN[3]]).to be(false)
    end

    it 'returns false for any other random obejct' do
      expect(sample_tree == 'WAT?').to be(false)
    end
  end

  # rubocop:disable RSpec/ExampleLength
  it 'implements #to_dot' do
    # "\n" is just to adjust to expectation :)
    expect("\n#{sample_tree.to_dot}").to eq("
Paste the Dot code here: http://magjac.com/graphviz-visual-editor/
digraph D {
  9 -> 1
  9 -> 2
  3 -> 9
  3 -> 20
  20 -> 15
  20 -> 7
}")
  end
  # rubocop:enable RSpec/ExampleLength
end
