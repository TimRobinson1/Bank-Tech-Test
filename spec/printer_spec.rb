require 'printer'

describe Printer do
  let(:printer) { described_class.new }
  let(:entry) do
    double :entry, date: 'now', credit: '10', debit: '', recorded_balance: '20'
  end

  it 'returns the provided balance with correct formatting' do
    expect(printer.display_balance(500.440123)).to eq '500.44'
  end

  it 'has a default balance header when printing' do
    expect { printer.display_statement([]) }
      .to output(Printer::BALANCE_HEADER + "\n").to_stdout
  end

  it 'displays transactions with formatted alignment' do
    expect(STDOUT).to receive(:puts).with(Printer::BALANCE_HEADER)
    expect(STDOUT).to receive(:puts)
      .with('   now    ||    10    ||          ||    20    ')
    printer.display_statement([entry])
  end
end
