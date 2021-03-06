# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  user = FactoryGirl.create(:user)
  describe 'User  -  Model' do
    it 'an instance of a user' do
      expect(User.new).to be_an_instance_of(User)
    end
    it 'create of a user' do
      u = User.create(name:'bob',email:'bob@gmail.com',password:'a',password_confirmation:'a') #is_admin intentionally left out.
      expect(u.name).to eq 'bob'
      expect(u.is_admin).to eq false #expecting default to be false!
    end
  end

  describe '#seat' do
    it 'has seats' do
      seat = FactoryGirl.create(:seat)
      user.seats << seat
      expect(user.seats.first).to be_an_instance_of(Seat)
    end
  end
end
