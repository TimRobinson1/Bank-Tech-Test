require 'withdrawal'

describe Withdrawal do
  let(:withdrawal) { described_class.new(150, 200) }

  it { is_expected.to be_a Withdrawal }

  it 'holds the withdrawn balance' do
    expect(withdrawal.amount).to eq '150.00'
  end

  it 'records the date of the withdrawal' do
    current_date = Time.new.strftime('%d-%m-%Y')
    expect(withdrawal.date).to eq current_date
  end

  it 'records the balance' do
    expect(withdrawal.recorded_balance).to eq '50.00'
  end
end
