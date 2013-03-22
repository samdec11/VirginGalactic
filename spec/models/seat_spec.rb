require 'spec_helper'
describe seat do
  let(:seat) {Seat.create(row:2,col:3,user_id:1,flight_id:2)}

  describe '.new' do
    it 'creates an instance of a seat' do
      expect(Seat.new).to be_an_instance_of(Seat)
    end
  end

  describe '.create' do
    it 'creates a seat' do
      seat.row.should eq 2
      seat.col.should eq 3
    end
  end

  describe '#flight' do
    it 'has a plane' do
      plane = FactoryGirl.create(:plane)
      flight.plane = plane
      flight.plane.should eq plane
    end
    it 'has a user' do
      user = FactoryGirl.create(:user)
      seats.user = user
      user.seats.should eq seat
    end
  end
end