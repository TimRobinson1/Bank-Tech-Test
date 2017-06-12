require 'account'

describe Account do
  let(:account) { described_class.new('Jane') }
  let(:large_account) { described_class.new('Rich', 3000) }

  it { is_expected.to be_a Account }
  it { is_expected.to respond_to :show_balance }

  it "holds the account owner's name" do
    expect(account.name).to eq 'Jane'
  end

  it 'starts with a default balance of zero' do
    expect(account.balance).to eq 0
  end

  it 'can be set with a higher starting balance' do
    expect(large_account.balance).to eq 3000
  end
end
