=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end

class SpiralMatrix
  def initialize(size)
    @size = size
    @matrix = Array.new(size) { Array.new(size) }
  end

  def matrix
    num = 1
    top, bottom, left, right = 0, @size - 1, 0, @size - 1

    while top <= bottom && left <= right
      # Fill top row (left to right)
      (left..right).each { |col| @matrix[top][col] = num; num += 1 }
      top += 1

      # Fill right column (top to bottom)
      (top..bottom).each { |row| @matrix[row][right] = num; num += 1 }
      right -= 1

      # Fill bottom row (right to left)
      (right.downto(left)).each { |col| @matrix[bottom][col] = num; num += 1 } if top <= bottom
      bottom -= 1

      # Fill left column (bottom to top)
      (bottom.downto(top)).each { |row| @matrix[row][left] = num; num += 1 } if left <= right
      left += 1
    end

    @matrix
  end
end