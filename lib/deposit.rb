
# Manages information on a deposit of money.
class Deposit
  attr_reader :amount, :date

  def initialize(amount = 0, date = Time.new)
    @amount = amount
    @date = date.strftime("%d-%m-%Y")
  end
end
