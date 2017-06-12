# Records account transaction values
class Transaction
  attr_reader :amount, :date, :recorded_balance, :credit, :debit

  def initialize(type, amount = 0, current_balance = 0, date = Time.new)
    @amount = format('%.2f', amount)
    @type = type
    @date = date.strftime('%d-%m-%Y')
    @recorded_balance = adjust_balance(current_balance, amount)
    assign_transaction_value
  end

  private

  def assign_transaction_value
    deposit? ? @credit = @amount : @debit = @amount
  end

  def adjust_balance(balance, amount)
    return format('%.2f', balance + amount) if deposit?
    format('%.2f', balance - amount)
  end

  def deposit?
    @type == :deposit
  end
end
