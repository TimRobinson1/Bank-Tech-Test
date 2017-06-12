# Manages a user's bank account
class Account
  attr_reader :name

  def initialize(name = 'User', starting_balance = 0)
    @name = name
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def current_balance
    format('%.2f', @balance)
  end
end
