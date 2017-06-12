# Understands printing account information
class Printer
  def display_statement(log)
    puts BALANCE_HEADER
    log.entries.reverse.each do |transaction|
      puts align_row(transaction).join('||')
    end
  end

  def display_balance(balance)
    format('%.2f', balance)
  end

  private

  BALANCE_HEADER = '   date   ||  credit  ||  debit   ||  balance'.freeze

  def align_row(transaction)
    row = [
      transaction.date,
      transaction.credit,
      transaction.debit,
      transaction.recorded_balance
    ]
    row.map { |entry| (entry || '').center(10, ' ') }
  end
end
