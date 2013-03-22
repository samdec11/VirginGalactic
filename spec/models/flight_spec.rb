require 'spec_helper'
describe Flight do
  let(:flight) {Flight.create(flight_num: '18', origin: 'NYC', dest: 'MIA', date: '2013-04-20')}

  describe '.new' do
    it 'creates an instance of a flight' do
      flight = Flight.new
      expect(flight).to be_an_instance_of(Flight)
    end
  end

  describe '.create' do
    it 'creates a flight' do
      flight.should be_an_instance_of(Flight)
      flight.name.should eq '18'
      flight.origin.should eq 'NYC'
      flight.dest.should eq 'MIA'
      flight.date.should eq '2013-04-20'
    end
  end

  describe '#plane' do
    it 'has a plane' do
      plane = FactoryGirl.create(:plane)
      flight.plane = plane
      flight.plane.should eq plane
    end
  end

  describe '#seats' do
    it 'has seats' do
      seat = FactoryGirl.create(:seat)
      flight.seats << seat
      flight.seats.count.should eq 1
    end
  end
end