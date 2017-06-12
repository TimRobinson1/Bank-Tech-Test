require 'deposit'

describe Deposit do
  let(:deposit) { described_class.new(100) }

  it { is_expected.to be_a Deposit }

  it 'holds the deposited balance' do
    expect(deposit.amount).to eq 100
  end

  it 'records the date of the deposit' do
    current_date = (Time.new).strftime("%d-%m-%Y")
    expect(deposit.date).to eq current_date
  end
end
