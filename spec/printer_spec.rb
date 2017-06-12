require 'printer'

describe Printer do
  let(:printer) { described_class.new }
  let(:entry) do
    double :deposit, date: 'now', amount: '10', recorded_balance: '20'
  end

  it { is_expected.to be_a Printer }
  it { is_expected.to respond_to :display_statement }

  it 'has a default balance header when printing' do
    expect(STDOUT).to receive(:puts).with(Printer::BALANCE_HEADER)
    printer.display_statement([])
  end

  it 'displays transactions with formatted alignment' do
    expect(STDOUT).to receive(:puts).with(Printer::BALANCE_HEADER)
    expect(STDOUT).to receive(:puts)
      .with('     12/06/2017     ||         10         ||         20         ')
    printer.display_statement([deposit])
  end
end
