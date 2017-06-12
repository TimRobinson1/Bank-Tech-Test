# Manages a user's bank account
class Account
  attr_reader :name, :balance

  def initialize(name = 'User', starting_balance = 0)
    @name = name
    @balance = starting_balance
  end

  def show_balance
  end
end
