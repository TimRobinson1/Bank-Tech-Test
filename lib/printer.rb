# Displays user's account balance
class Printer
  BALANCE_HEADER = '   date   ||  credit  ||  debit   ||  balance'.freeze

  def display_statement(entries)
    puts BALANCE_HEADER
    entries.each do |transaction|
      puts align_row(transaction).join('||')
    end
  end

  private

  def align_row(transaction)
    row = [
      transaction.date,
      transaction.credit,
      transaction.debit,
      transaction.recorded_balance
    ]
    row.map { |x| (x || '').center(10, ' ') }
  end
end
