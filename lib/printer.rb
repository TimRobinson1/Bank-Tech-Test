class Printer
  attr_reader

  def initialize
    @header = 'date || credit || debit || balance'
  end

  def display_statement(account)
    puts account
  end
end
