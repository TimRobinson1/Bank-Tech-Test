require_relative 'transaction'
require_relative 'printer'

# Manages a user's bank account
class Account
  attr_reader :history

  def deposit(amount)
    @history << Transaction.new(:deposit, amount, @balance)
    @balance += amount.round(2)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @history << Transaction.new(:withdrawal, amount, @balance)
    @balance -= amount.round(2)
  end

  def current_balance
    format('%.2f', @balance)
  end

  def bank_statement
    @printer.display_statement(@history)
    "#{@name}'s available funds: £#{current_balance}"
  end

  private

  NEW_BALANCE = 0

  def initialize(name = 'Client', starting_balance = NEW_BALANCE)
    @name = name
    @balance = starting_balance
    @history = []
    @printer = Printer.new
  end

  def insufficient_funds?(withdrawal)
    withdrawal > @balance
  end
end
