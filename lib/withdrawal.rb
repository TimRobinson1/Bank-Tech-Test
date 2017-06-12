# Manages information on a withdrawal of money.
class Withdrawal
  attr_reader :amount

  def initialize(amount = 0, current_balance = 0, date = Time.new)
    @amount = amount
    @date = date.strftime("%d-%m-%Y")
    @recorded_balance = current_balance - amount
  end
end
