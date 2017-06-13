# Understands transaction values
class Transaction
  attr_reader :amount, :date, :recorded_balance

  def credit
    @amount if deposit?
  end

  def debit
    @amount unless deposit?
  end

  private

  def initialize(type, amount = 0, current_balance = 0)
    @amount = format('%.2f', amount)
    @type = type
    @date = Time.new.strftime('%d-%m-%Y')
    @recorded_balance = format('%.2f', current_balance)
  end

  def deposit?
    @type == :deposit
  end
end
