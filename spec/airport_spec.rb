require 'airport.rb'

describe Airport do

  let(:plane)   { double :plane, land: nil, takeoff: nil }
  let(:weather) { double :weather }

  before (:each) do
    allow(weather).to receive(:is_stormy?).and_return(false)
  end

  describe '#instruct_to_land' do

    it 'calls the land method on passed argument (plane)' do
      subject.instruct_to_land(weather, plane)
        expect(plane).to have_received(:land)
    end

    it 'reports confirmation that a landing has taken place' do
      subject.instruct_to_land(weather, plane)
      expect(subject.storage).to include(plane)
    end

    it 'prevents landing if the airport is full' do
      allow(subject).to receive(:airport_full?).and_return(true)
      expect { subject.instruct_to_land(weather, plane) }.to raise_error "Airport full."
    end

    it 'prevents landing when weather is stormy' do
      allow(weather).to receive(:is_stormy?).and_return(true)
      expect { subject.instruct_to_land(weather, plane) }.to raise_error "Too stormy."
    end

  end

  describe '#@storage' do
    it 'provides an area for planes to land in' do
      expect(subject.storage).to be_a(Array)
    end

    it 'receives landed planes into @storage array' do
      allow(plane).to receive(:land)
      subject.instruct_to_land(weather, plane)
      expect(subject.storage.size).to be > 0
    end

    describe '#instruct_takeoff' do

      it 'does the plane take off?' do
        subject.instruct_takeoff(weather, plane)
        expect(subject.storage).to be_empty
      end

      it 'prevents takeoff when weather is stormy' do
        allow(weather).to receive(:is_stormy?).and_return(true)
        expect { subject.instruct_takeoff(weather, plane) }.to raise_error "Too stormy."
      end

    end
  end
end
