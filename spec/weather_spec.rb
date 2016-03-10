require 'weather'

describe Weather do

    # let(:storm)    { described_class.new(Random.rand(1..2))   # NOT A DOUBLE!
    # let(:storm)    { described_class.new }
  # let(:not_stormy)  { double described_class.new(3..10) }   # (so also not a double!)

  it 'is receives with a random number from storm creator' do
    subject.storm_creator
    expect(subject.number).to be_between(1, 10).inclusive
  end

  it 'is stormy when number returned is below 3' do
    allow(subject).to receive(:number).and_return(1)
    expect(subject.is_stormy?).to eq true
  end

end
