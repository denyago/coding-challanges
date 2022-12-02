# frozen_string_literal: true

# Given an `m x n` integer matrix matrix,
# if an element is 0, set its entire row and column to 0's.
#
# You must do it in place.
#
#   \/- 'i'
#   [[0,1,2,0], <- 'j'
#    [3,4,5,2],
#    [1,3,1,5]]
#
#   [[0,0,0,0],
#    [0,4,5,0],
#    [0,3,1,0]]
#
# Constraints:
#   - `m == matrix.length`
#   - `n == matrix[0].length`
#   - `1 <= m, n <= 200`
#   - `-231 <= matrix[i][j] <= 231 - 1`
#
# Follow up:
#   A straightforward solution using `O(mn)` space is probably a bad idea.
#   A simple improvement uses `O(m + n)` space, but still not the best solution.
module SetMatrixZeroes
  # rubocop:disable Naming/AccessorMethodName
  # TODO: My `dotfiles` - ALE does not see the local workspace Rubocop config.
  # Therefore I see inconsistent results.
  # @param {Integer[][]} matrix
  # @return {Void} Do not return anything, modify matrix in-place instead.
  def self.set_zeroes(matrix)
    i_max = matrix.size - 1
    j_max = matrix.first.size - 1

    i_columns = Set.new
    j_rows = Set.new
    # 1. Loop over the matrix and identify where are zeros
    #    Also, note what must be changed in some set / array
    matrix.each_with_index do |row, i|
      row.each_with_index do |n, j|
        if n.zero?
          i_columns << i
          j_rows << j
        end
      end
    end
    # 2. Apply changes. Optimization: don't loop over a row or
    #    column we have applied changes to already.
    i_columns.each do |i|
      (0..j_max).each do |j|
        matrix[i][j] = 0
      end
    end

    j_rows.each do |j|
      (0..i_max).each do |i|
        matrix[i][j] = 0
      end
    end

    matrix
  end
  # rubocop:enable Naming/AccessorMethodName
end
