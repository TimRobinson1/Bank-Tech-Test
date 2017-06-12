require_relative 'transaction_log'
require_relative 'printer'

# Understands account activity
class Account
  attr_reader :history

  def deposit(amount)
    @history.update(:deposit, amount, @balance)
    @balance += amount.round(2)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @history.update(:withdrawal, amount, @balance)
    @balance -= amount.round(2)
  end

  def current_balance
    @printer.display_balance(@balance)
  end

  def bank_statement
    @printer.display_statement(@history)
  end

  private

  NEW_BALANCE = 0

  def initialize(starting_balance = NEW_BALANCE)
    @balance = starting_balance
    @history = TransactionLog.new
    @printer = Printer.new
  end

  def insufficient_funds?(withdrawal)
    withdrawal > @balance
  end
end
