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

end