require 'account'

describe Account do
  let(:account) { described_class.new }
  let(:wealthy_account) { described_class.new(3000) }
  let(:student_account) { described_class.new(10.54) }

  it 'starts with an empty transaction history' do
    expect(account.history.entries).to be_empty
  end

  describe '#current_balance' do
    it 'starts with a default balance of zero' do
      expect(account.current_balance).to eq '0.00'
    end

    it 'can be set with a higher starting balance' do
      expect(wealthy_account.current_balance).to eq '3000.00'
    end

    it 'can display decimal point values in a balance' do
      expect(student_account.current_balance).to eq '10.54'
    end
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
      first_deposit = account.history.entries[0]
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
    before do
      Timecop.freeze(Time.local(2017))
    end

    after do
      Timecop.return
    end

    it 'displays in standard output' do
      expect(STDOUT).to receive(:puts)
      account.bank_statement
    end

    it 'outputs empty statement with no history' do
      expect { account.bank_statement }
        .to output(Printer::BALANCE_HEADER + "\n").to_stdout
    end

    it 'outputs transactional history' do
      account.deposit(50)
      expect { account.bank_statement }.to output(
        "#{Printer::BALANCE_HEADER}\n" \
        "#{Time.new.strftime('%d-%m-%Y')}||  50.00   ||          ||  50.00   \n"
      ).to_stdout
    end
  end
end
