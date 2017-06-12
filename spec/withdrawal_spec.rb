require 'withdrawal'

describe Withdrawal do
  let(:withdrawal) { described_class.new(100) }

  it { is_expected.to be_a Withdrawal }

  it 'holds the withdrawn balance' do
    expect(withdrawal.amount).to eq 100
  end
end
