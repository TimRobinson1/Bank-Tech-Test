require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'printer'

# Manages a user's bank account
class Account
  attr_reader :name, :history

  def initialize(name = 'User', starting_balance = 0)
    @name = name
    @balance = starting_balance
    @history = []
    @printer = Printer.new
  end

  def deposit(amount)
    @history << Deposit.new(amount, @balance)
    @balance += amount.round(2)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @history << Withdrawal.new(amount, @balance)
    @balance -= amount.round(2)
  end

  def current_balance
    format('%.2f', @balance)
  end

  def bank_statement
    @printer.display_statement(@history)
    "#{@name}'s available funds: £#{@balance}"
  end

  private

  def insufficient_funds?(withdrawal)
    withdrawal > @balance
  end
end
