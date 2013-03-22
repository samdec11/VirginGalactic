# == Schema Information
#
# Table name: seats
#
#  id         :integer          not null, primary key
#  row        :integer
#  col        :integer
#  flight_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
describe Seat do

  let(:seat) {Seat.create(row:2, col:3)}

  describe '.new' do
    it 'creates an instance of a seat' do
      expect(Seat.new).to be_an_instance_of(Seat)
    end
  end

  describe '.create' do
    it 'creates a seat' do
      seat.should be_an_instance_of(Seat)
      seat.row.should eq 2
      seat.col.should eq 3
    end
  end

  describe '#flight' do
    it 'has a flight' do
      flight = FactoryGirl.create(:flight)
      seat.flight = flight
      seat.flight.should eq flight
    end
  end

  describe '#user' do
    it 'has a user' do
      user = FactoryGirl.create(:user)
      seat.user = user
      seat.user.should eq user
    end
  end
end
