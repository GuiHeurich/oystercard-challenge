require 'station'

describe Station do

  subject(:station) { described_class.new("Barking", 3) }

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

  describe '#name' do
    context 'when created' do
      it 'has a name' do
        expect(station.name).to eq("Barking")
      end
    end
  end

  describe '#zone' do
    context 'when created' do
      it 'has a zone number' do
        expect(station.zone).to eq(3)
      end
    end
  end
end
