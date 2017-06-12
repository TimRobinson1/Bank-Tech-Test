# Displays user's account balance
class Printer
  BALANCE_HEADER = 'date || credit || debit || balance'.freeze

  def initialize
    @header = BALANCE_HEADER
  end

  def display_statement(account)
    puts @header
    account.each do |transaction|
      puts align_row(transaction).join('||')
    end
  end

  private

  def align_row(transaction)
    row = [transaction.date, transaction.amount, transaction.recorded_balance]
    row.map { |x| x.center(20, ' ') }
  end
end
