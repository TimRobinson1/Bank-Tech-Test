# Manages information on a withdrawal of money.
class Withdrawal
  attr_reader :amount, :date, :recorded_balance, :credit, :debit

  def initialize(amount = 0, current_balance = 0, date = Time.new)
    @amount = format('%.2f', amount)
    @date = date.strftime('%d-%m-%Y')
    @recorded_balance = format('%.2f', current_balance - amount)
    @credit = ''
    @debit = @amount
  end
end
