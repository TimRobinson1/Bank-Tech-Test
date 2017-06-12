require 'account'

describe Account do
  let(:account) { described_class.new('Jane') }
  let(:large_account) { described_class.new('Rich', 3000) }
  let(:student_account) { described_class.new('Student', 10.54) }

  it { is_expected.to be_a Account }
  it { is_expected.to respond_to :current_balance }

  it "holds the account owner's name" do
    expect(account.name).to eq 'Jane'
  end

  it 'starts with a default balance of zero' do
    expect(account.current_balance).to eq '0.00'
  end

  it 'can be set with a higher starting balance' do
    expect(large_account.current_balance).to eq '3000.00'
  end

  it 'can display decimal point values in a balance' do
    expect(student_account.current_balance).to eq '10.54'
  end

  describe '#deposit' do
    it 'adds supplied funds to the balance' do
      account.deposit(300)
      account.deposit(50.30)
      expect(account.current_balance).to eq '350.30'
    end
  end
end
