require 'oystercard'

describe Oystercard do
  # In order to use public transport
  # As a customer
  # I want money on my card
  describe '#balance' do
    context 'when a user needs to know its balance' do
      it 'checks for the balance' do
        oystercard = Oystercard.new
        expect(oystercard).to respond_to(:balance)
        expect(oystercard.balance).to eq 0
      end
    end
  end
end
