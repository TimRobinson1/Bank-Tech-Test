require 'deposit'

# Manages a user's bank account
class Account
  attr_reader :name, :history

  def initialize(name = 'User', starting_balance = 0)
    @name = name
    @balance = starting_balance
    @history = []
  end

  def deposit(amount)
    @history << Deposit.new(amount)
    @balance += amount
  end

  def current_balance
    format('%.2f', @balance)
  end
end
