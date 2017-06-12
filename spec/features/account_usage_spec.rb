require 'account'

feature 'User interaction' do
  scenario 'basic account usage' do
    sets_up_new_account
    makes_some_deposits
    withdraws_cash
    attempts_to_withdraw_too_much
    checks_first_deposit
    checks_first_withdrawal
  end

  def sets_up_new_account
    @account = Account.new('Dave', 10)
    @date = Time.new.strftime('%d-%m-%Y')
    expect(@account.current_balance).to eq '10.00'
  end

  def makes_some_deposits
    @account.deposit(100.34)
    expect(@account.current_balance).to eq '110.34'
    @account.deposit(3.99)
    expect(@account.current_balance).to eq '114.33'
  end

  def withdraws_cash
    @account.withdraw(100)
    expect(@account.current_balance).to eq '14.33'
  end

  def attempts_to_withdraw_too_much
    expect { @account.withdraw(40) }.to raise_error 'Insufficient funds'
    expect(@account.current_balance).to eq '14.33'
  end

  def checks_first_deposit
    first_deposit = @account.history[0]
    expect(first_deposit.recorded_balance).to eq '110.34'
    expect(first_deposit.date).to eq @date
  end

  def checks_first_withdrawal
    first_withdrawal = @account.history[2]
    expect(first_withdrawal.amount).to eq '100.00'
    expect(first_withdrawal.recorded_balance).to eq '14.33'
  end
end
