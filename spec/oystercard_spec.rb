require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station) { double :station, name: "Barking" }
  let(:station_two) { double :station_two, name: "Gospel Oak"}
  let(:journey) {
    double :journey,
    :start_journey => "",
    :end_journey => "",
    :entry_station => station,
    :exit_station => station_two
   }

  describe '#balance' do
    context 'when a user needs to know its balance' do
      it 'checks for the balance' do
        expect(oystercard).to respond_to(:balance)
        expect(oystercard.balance).to eq 0
      end
    end
  end

  describe '#top_up' do
    context 'when a user needs to use public transport' do
      it 'adds money to a card' do
        expect(oystercard).to respond_to(:top_up).with(1).argument
        expect(oystercard.top_up(20)).to eq(20)
      end
    end

    context 'when a user tries to add more than 90 pounds' do
      it 'raises an error' do
        expect { oystercard.top_up(100) }.to raise_error("Maximum balance is £90!")
      end
    end
  end

  describe '#touch_in' do
    context 'when a user needs to use public transport' do
      it 'they touch in their card' do
        oystercard.top_up(20)
        # allow(journey).to receive(:start_journey)
        expect(oystercard).to respond_to(:touch_in)
      end
    end

    context 'when a card does not have the minimum balance' do
      it 'raises an error to prevent touch in' do
        expect { oystercard.touch_in(station, journey) }.to raise_error("Minimum balance is £1!")
      end
    end
  end

  describe '#touch_out' do
    context 'when a user needs to use public transport' do
      it 'they touch out their card' do
        expect(oystercard).to respond_to(:touch_out)
      end
    end

    context 'when a user needs to use public transport' do
      it 'they touch out their card' do
        oystercard.top_up(20)
        oystercard.touch_in(station, journey)
        allow(journey).to receive(:fare).and_return(3)
        expect { oystercard.touch_out(station_two) }.to change { oystercard.balance }.by(-3)
      end
    end
  end

  describe '#list_of_journeys' do
    context 'when a user touches in and out' do
      it 'remembers the journey' do
        oystercard.top_up(20)
        oystercard.touch_in(station, journey)
        allow(journey).to receive(:fare).and_return(3)
        oystercard.touch_out(station_two)
        expect(oystercard.list_of_journeys[0]).to eq("Entry station: #{station}" => "Exit station: #{station_two}")
      end
    end
  end
end
