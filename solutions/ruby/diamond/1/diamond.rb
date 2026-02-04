=begin
Write your code for the 'Diamond' exercise in this file. Make the tests in
`diamond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/diamond` directory.
=end

module Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(str)
    return "A\n" if str == 'A'

    lines = []
    max_width = 2 * (str.ord - 'A'.ord) + 1
    (0..(str.ord - 'A'.ord)).each do |i|
      letter = ALPHABET[i]
      outer_spaces = ' ' * (str.ord - 'A'.ord - i)
      if letter == 'A'
        lines << "#{outer_spaces}A#{outer_spaces}"
      else
        inner_spaces = ' ' * (2 * i - 1)
        lines << "#{outer_spaces}#{letter}#{inner_spaces}#{letter}#{outer_spaces}"
      end
    end

    # Mirror the top (excluding the middle)
    full_diamond = lines + lines.reverse[1..-1]
    full_diamond.join("\n") + "\n"
  end
end