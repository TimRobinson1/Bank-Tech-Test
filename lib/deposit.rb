
# Manages information on a deposit of money.
class Deposit
  attr_reader :amount, :date, :recorded_balance

  def initialize(amount = 0, current_balance = 0, date = Time.new)
    @amount = amount
    @date = date.strftime("%d-%m-%Y")
    @recorded_balance = current_balance + amount
  end
end
