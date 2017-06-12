require 'transaction_log'

describe TransactionLog do
  let(:log) { described_class.new }

  it 'starts with an empty history' do
    expect(log.entries).to be_empty
  end

  describe '#update' do
    it 'adds transaction to history' do
      log.update(:deposit, 100, 50)
      expect(log.entries.first).to be_a Transaction
    end
  end
end
