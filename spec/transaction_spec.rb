require 'transaction'

describe Transaction do
  let(:deposit) { described_class.new(:deposit, 100) }
  let(:withdrawal) { described_class.new(:withdrawal, 100) }

  it 'holds the transactioned balance' do
    expect(deposit.amount).to eq '100.00'
  end

  it 'records the date of the transaction' do
    current_date = Time.new.strftime('%d-%m-%Y')
    expect(deposit.date).to eq current_date
  end

  it 'records the balance' do
    expect(deposit.recorded_balance).to eq '100.00'
  end

  it 'records a deposit as a credited value' do
    expect(deposit.credit).to eq '100.00'
  end

  it 'records a withdrawal as a debited value' do
    expect(withdrawal.debit).to eq '100.00'
  end

  it 'has no debit value when it is a deposit' do
    expect(deposit.debit).to be_nil
  end

  it 'has no credit value when it is a withdrawal' do
    expect(withdrawal.credit).to be_nil
  end
end
