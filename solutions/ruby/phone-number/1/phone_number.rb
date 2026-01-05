=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end

class PhoneNumber
  def self.clean number
    digits = number.gsub(/\D/, '')
    digits = digits.sub(/^1/, '')
    if digits.size != 10 || digits[0] == '0' || digits[3] == '0' || digits[0] == '1' || digits[3] == '1'
      nil
    else
      digits
    end
  end
end