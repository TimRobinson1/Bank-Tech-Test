require 'deposit'

describe Deposit do
  let(:deposit) { described_class.new(100) }

  it { is_expected.to be_a Deposit }
end
