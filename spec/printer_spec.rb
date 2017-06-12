require 'printer'

describe Printer do
  let(:printer) { described_class.new }

  it { is_expected.to be_a Printer }
  it { is_expected.to respond_to :display_statement }
end
