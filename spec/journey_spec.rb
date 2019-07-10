require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:station) { double :station, name: "Barking", zone: 3 }
  let(:station_two) { double :station_two, name: "Gospel Oak", zone: 1}

  describe '#start_journey' do
    context 'when a user touches in' do
      it 'records the entry station' do
        journey.start_journey(station)
        expect(journey.entry_station).to eq(station)
        expect(journey.in_journey?).to eq(true)
      end
    end
  end

  describe '#end_journey' do
    context 'when a user touches out' do
      it 'records the exit station' do
        journey.end_journey(station_two)
        expect(journey.exit_station).to eq(station_two)
        expect(journey.in_journey?).to eq(false)
      end
    end
  end

  describe '#fare' do
    context 'when a user touches in and out' do
      it 'calcutates the fare' do
        journey.start_journey(station)
        expect(journey.end_journey(station_two)).to eq(3)
      end
    end

    context 'when a user does not touch in' do
      it 'calcutates a penalty' do
        journey.end_journey(station_two)
        expect(journey.fare).to eq(6)
      end
    end

    context 'when a user does not touch out' do
      it 'calcutates a penalty' do
        journey.start_journey(station)
        expect(journey.fare).to eq(6)
      end
    end
  end
end
