require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

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

    # In order to protect my money
    # As a customer
    # I don't want to put too much money on my card

    context 'when a user tries to add more than 90 pounds' do
      it 'raises an error' do
        expect { oystercard.top_up(100) }.to raise_error("Maximum balance is 90 pounds!")
      end
    end
  end
end
