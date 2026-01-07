=begin
Write your code for the 'Bank Account' exercise in this file. Make the tests in
`bank_account_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bank-account` directory.
=end

class BankAccount
  def initialize
    @active = false
  end

  def open
    raise ArgumentError.new("You can't open an already open account") if @active
    @active = true
    @balance = 0
  end

  def close
    raise ArgumentError.new("You can't close an already closed account") if !@active
    @active = false
    @balance = 0
  end

  def deposit amount
    raise ArgumentError.new("You can't deposit money into a closed account") if !@active
    raise ArgumentError.new("You can't deposit a negative amount") if amount < 0
    @balance += amount
  end

  def withdraw amount
    raise ArgumentError.new("You can't withdraw money into a closed account") if !@active
    raise ArgumentError.new("You can't withdraw more than you have") if amount > @balance
    raise ArgumentError.new("You can't withdraw a negative amount") if amount < 0
    
    @balance -= amount
  end

  def balance
    raise ArgumentError.new("You can't check the balance of a closed account") if !@active
    @balance
  end
end