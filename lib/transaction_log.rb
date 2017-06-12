require_relative 'transaction'

# Understands Transaction History
class TransactionLog
  attr_reader :entries

  def update(type, amount, balance)
    @entries << @entry.new(type, amount, balance)
  end

  private

  def initialize(entry = Transaction)
    @entry = entry
    @entries = []
  end
end
