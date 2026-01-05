=begin
Write your code for the 'Crypto Square' exercise in this file. Make the tests in
`crypto_square_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/crypto-square` directory.
=end

class Crypto
  def initialize(plaintext)
    @cleantext = plaintext.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def ciphertext
    return @cleantext if @cleantext.empty?
    length = @cleantext.length

    r = Math.sqrt(length).ceil
    c = (length.to_f / r).ceil
    
    if c < r || (c - r) > 1
      r = Math.sqrt(length).floor
      c = (length.to_f / r).ceil
    end
    
    total_needed = r * c
    padded_text = @cleantext.ljust(total_needed, ' ')
  
    columns = []
    c.times do |col|
      column_text = ''
      r.times do |row|
        column_text += padded_text[row * c + col]
      end
      columns << column_text
    end
  
    columns.join(' ')
  end
end