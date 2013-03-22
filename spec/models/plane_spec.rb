require 'spec_helper'

describe Plane do
  let(:plane) {Plane.create(name:'Boeing 747', rows:6, cols:30)}

  describe '.new' do
    it 'creates an instance of plane' do
      p = Plane.new
      expect(p).to be_an_instance_of(Plane)
    end
  end

  describe '.create' do
    it 'creates a plane' do
      expect(plane.id).to_not be nil
      expect(plane.name).to eq 'Boeing 747'
      expect(plane.rows).to eq 6
      expect(plane.cols).to eq 30
    end
  end

  describe '#flight' do
    it 'has a flight' do
      flight = FactoryGirl.create(:flight)
      plane.flights << flight
      expect(plane.flights.first.name).to eq '1234'
    end
  end
end