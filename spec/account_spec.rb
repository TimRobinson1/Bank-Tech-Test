require 'account'

describe Account do
  let(:account) { described_class.new('Jane') }
  let(:wealthy_account) { described_class.new('Rich', 3000) }
  let(:student_account) { described_class.new('Student', 10.54) }

  it { is_expected.to be_a Account }
  it { is_expected.to respond_to :current_balance }

  it "holds the account owner's name" do
    expect(account.name).to eq 'Jane'
  end

  it 'starts with a default balance of zero' do
    expect(account.current_balance).to eq '0.00'
  end

  it 'starts with an empty transaction history' do
    expect(account.history).to be_empty
  end

  it 'can be set with a higher starting balance' do
    expect(wealthy_account.current_balance).to eq '3000.00'
  end

  it 'can display decimal point values in a balance' do
    expect(student_account.current_balance).to eq '10.54'
  end

  describe '#deposit' do
    it 'adds supplied funds to the balance' do
      account.deposit(300)
      expect(account.current_balance).to eq '300.00'
    end

    it 'adds successively supplied funds to the balance' do
      account.deposit(300)
      account.deposit(50.30)
      expect(account.current_balance).to eq '350.30'
    end

    it 'records old balances successfully' do
      account.deposit(20)
      account.deposit(50)
      first_deposit = account.history[0]
      expect(first_deposit.recorded_balance).to eq '20.00'
    end
  end

  describe '#withdraw' do
    it 'removes specified amount from the balance' do
      wealthy_account.withdraw(300)
      expect(wealthy_account.current_balance).to eq '2700.00'
    end

    it 'removes specified amount from the balance' do
      wealthy_account.withdraw(300)
      expect(wealthy_account.current_balance).to eq '2700.00'
    end

    it 'raises error if the withdrawal is more than available' do
      expect { account.withdraw(50) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#bank_statement' do
    it 'outputs empty statement with no history' do
      expect(STDOUT).to receive(:puts).with(Printer::BALANCE_HEADER)
      account.bank_statement
    end

    it 'outputs transactional history' do
      date = (Time.new).strftime("%d-%m-%Y")
      expect(STDOUT).to receive(:puts).with(Printer::BALANCE_HEADER)
      expect(STDOUT).to receive(:puts)
      .with("     #{date}     ||       50.00        ||       50.00        ")
      account.deposit(50)
      account.bank_statement
    end
  end
end
