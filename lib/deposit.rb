# Manages information on a deposit of money.
class Deposit
  attr_reader :amount, :date, :recorded_balance, :credit, :debit

  def initialize(amount = 0, current_balance = 0, date = Time.new)
    @amount = format('%.2f', amount)
    @date = date.strftime('%d-%m-%Y')
    @recorded_balance = format('%.2f', current_balance + amount)
    @credit = @amount
    @debit = ''
  end
end
