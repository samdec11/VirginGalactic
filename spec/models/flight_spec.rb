# == Schema Information
#
# Table name: flights
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  origin     :string(255)
#  dest       :string(255)
#  dep_time   :date
#  plane_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flight_num :integer
#

require 'spec_helper'
describe Flight do
  let(:flight) {Flight.create(name: 'E12', origin: 'NYC', dest: 'MIA', dep_time: '2013-04-20')}

  describe '.new' do
    it 'creates an instance of a flight' do
      flight = Flight.new
      expect(flight).to be_an_instance_of(Flight)
    end
  end

  describe '.create' do
    it 'creates a flight' do
      flight.should be_an_instance_of(Flight)
      flight.name.should eq "E12"
      flight.origin.should eq 'NYC'
      flight.dest.should eq 'MIA'
      flight.dep_time.should eq flight.dep_time
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
