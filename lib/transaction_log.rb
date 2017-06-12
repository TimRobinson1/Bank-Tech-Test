require_relative 'transaction'

# Understands Transaction History
class TransactionLog
  attr_reader :entries

  def initialize(entry = Transaction)
    @entry = entry
    @entries = []
  end

  def update(type, amount, balance)
    @entries << @entry.new(type, amount, balance)
  end
end
