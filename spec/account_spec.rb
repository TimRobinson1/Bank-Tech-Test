require 'account'

describe Account do
  it { is_expected.to be_a Account }

  it { is_expected.to respond_to :show_balance }
end
